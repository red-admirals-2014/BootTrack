require 'json'

class Graduate < ActiveRecord::Base
  attr_accessible :cohort_id, :name, :linked_in, :email, :location, :employer, :picture
  belongs_to :cohort
end
