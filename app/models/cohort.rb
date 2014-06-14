class Cohort < ActiveRecord::Base
  has_many :graduates

  def cohort_location
    @location = DBC::Cohort.location.to_json
    JSON.parse(@location)
  end

  def cohort_date
    @start_date = DBC::Cohort.start_date.to_json
    JSON.parse(@start_date)
  end

end
