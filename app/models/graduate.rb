require 'json'

class Graduate < ActiveRecord::Base
  attr_accessible :cohort_id, :name, :linked_in, :email, :location, :employer, :picture
  validates :email, uniqueness: true
  belongs_to :cohort
  include ApplicationHelper

  def self.get_graduates(campus, year)
    graduates = Graduate.joins(:cohort).select("graduates.*, cohorts.start_date as start_date, cohorts.campus as campus").order('start_date DESC').first(300) if campus=='default' && year=='default'
    graduates = Cohort.where(campus: campus).joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').first(300) if campus!='default' && year=='default'
    graduates = Cohort.joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').where('extract(year  from start_date) = ?', year).limit(300) if campus=='default' && year!='default'
    graduates = Cohort.joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').where(campus: campus).where('extract(year  from start_date) = ?', year).limit(300) if campus!='default' && year!='default'
    return graduates
  end

  def self.get_locations(campus, year)
    graduates = Graduate.select("location, count(name) as number").group(:location) if campus=='default' && year=='default'
    graduates = Cohort.where(campus: campus).select("location, count(name) as number").group(:location)if campus!='default' && year=='default'
    graduates = Cohort.joins(:graduates).where('extract(year  from start_date) = ?', year).select("location, count(name) as number").group(:location) if campus=='default' && year!='default'
    graduates = Cohort.joins(:graduates).where(campus: campus).where('extract(year  from start_date) = ?', year).select("location, count(name) as number").group(:location) if campus!='default' && year!='default'
    return graduates
  end

end
