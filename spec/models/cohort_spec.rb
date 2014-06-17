require 'spec_helper'

describe Cohort do
  context "Validations" do
    it { should have_many(:graduates) }
  end
  context "Attribute Accessibility" do
    it { should allow_mass_assignment_of(:id) }
    it { should allow_mass_assignment_of(:campus) }
    it { should allow_mass_assignment_of(:start_date) }
  end
end