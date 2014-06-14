class Cohort < ActiveRecord::Base
  has_many :graduates
  attr_accessible :id, :location, :start_date

  def self.get_cohort
    @cohort = DBC::Cohort.all.to_json
    JSON.parse(@cohort)
  end

end
