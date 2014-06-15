require 'json'

class Graduate < ActiveRecord::Base
  attr_accessible :cohort_id, :name, :linked_in, :email, :location, :employer, :picture
  validates :email, uniqueness: true
  belongs_to :cohort
end
