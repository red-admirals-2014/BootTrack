require 'json'

class Graduate < ActiveRecord::Base
  include ApplicationHelper
  attr_accessible :cohort_id, :name, :title, :linked_in, :email, :location, :employer, :picture, :latitude, :longitude
  validates :email, uniqueness: true
  belongs_to :cohort
  geocoded_by :location
  after_validation :geocode#, :if => :location_changed?

  def self.get_graduates(campus, year)
    campus = nil if campus == 'default'
    year = nil if year == 'default'
    campus ||=Cohort.pluck(:campus).uniq
    year||=Cohort.pluck('extract(year  from start_date)').uniq
    graduates =  Graduate.joins(:cohort).where(cohorts: {campus:campus}).select("graduates.*, cohorts.start_date as start_date, cohorts.campus as campus").order('start_date DESC').where('extract(year from start_date) IN (?)', year).limit(100)
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

  def self.by_location(location)
    Graduate.joins(:cohort).where(location: location).select("graduates.*, cohorts.start_date as start_date, cohorts.campus as campus").order('start_date DESC').limit(100)
  end

  def self.clear_future
    counter = 0
    graduates = Graduate.joins(:cohort).select('graduates.id, extract(year from start_date) as year, extract(month from start_date) as month')
    graduates.each do |graduate|
      if graduate.year == "#{Time.new.year}" && graduate.month > "#{Time.new.month - 2}"
        Graduate.find(graduate.id).delete
        counter+=1
      end
    end
    Graduate.find_by_name("dummy").delete
    p counter
  end

end
