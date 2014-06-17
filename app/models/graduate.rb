require 'json'

class Graduate < ActiveRecord::Base
  attr_accessible :cohort_id, :name, :linked_in, :email, :location, :employer, :picture
  validates :email, uniqueness: true
  belongs_to :cohort
  include ApplicationHelper

  def self.get_graduates(campus, year)

    campus ||=Cohort.pluck(:campus).uniq #=['San Francisco','New York', 'Chicago'] - be careful of calling more than once.

    year ||= [2012,2013,2014] #get from DB


    graduates =  Graduate.joins(:cohort).where(cohorts: {campus:campus}).order('start_date DESC').where('extract(year from start_date) IN (?)', year).limit(300)
    # Consider storing the year in your db?

    return graduates
  end

  def self.get_locations(graduates)
    return [["San Francisco Bay Area", 300]]
  end

end
