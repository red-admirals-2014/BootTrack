class Cohort < ActiveRecord::Base
  has_many :graduates
  attr_accessible :id, :campus, :start_date

end
