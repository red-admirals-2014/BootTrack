require 'json'

class Graduate < ActiveRecord::Base
  include ApplicationHelper
  attr_accessible :cohort_id, :name, :linked_in, :email, :location, :employer, :picture, :latitude, :longitude
  validates :email, uniqueness: true
  belongs_to :cohort
  geocoded_by :location
  after_validation :geocode#, :if => :location_changed?

  def self.get_graduates(campus, year)
    campus = nil if campus == 'default'
    year = nil if year == 'default'
    campus ||=Cohort.pluck(:campus).uniq
    year||=Cohort.pluck('extract(year  from start_date)').uniq
    graduates =  Graduate.joins(:cohort).where(cohorts: {campus:campus}).select("graduates.*, cohorts.start_date as start_date, cohorts.campus as campus").order('start_date DESC').where('extract(year from start_date) IN (?)', year).limit(300)
    return graduates
  end

  def self.get_locations(campus, year)
    campus = nil if campus == 'default'
    year = nil if year == 'default'
    campus ||=Cohort.pluck(:campus).uniq
    year||=Cohort.pluck('extract(year  from start_date)').uniq
    graduates =  Graduate.joins(:cohort).where(cohorts: {campus:campus}).select('latitude,longitude,location, count(name) as grads_number').where('extract(year from start_date) IN (?)', year).group('latitude,longitude,location')
    return graduates
  end

  def self.update_geolocations
    Graduate.all.each do |graduate|
      graduate.save
      p graduate.longitude
    end

  end

end
