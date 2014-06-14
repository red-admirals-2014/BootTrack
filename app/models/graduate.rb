require 'json'

class Graduate < ActiveRecord::Base
  attr_accessible :cohort_id, :name, :linked_in, :email
  belongs_to :cohort
  # :name, :location, :year
  def self.grad_name
    @grads = DBC::User.all.to_json
    JSON.parse(@grads)
  end
end
