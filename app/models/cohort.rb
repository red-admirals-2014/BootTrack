class Cohort < ActiveRecord::Base
  has_many :graduates
  attr_accessible :id, :location, :start_date

end
