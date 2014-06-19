require "spec_helper"
I18n.enforce_available_locales = false

describe Graduate do
  it "name should equal Kelley Puckett" do
    grad = Graduate.new
    grad.name = "Kelley Puckett"
    grad.email = "kelley@comics.com"
    grad.save
    expect(grad.reload.name).to eq "Kelley Puckett"
  end

  context "Validations" do
    it {should belong_to(:cohort)}
    it {should validate_uniqueness_of(:email)}
  end

  context "Attribute Accessibility" do
    it {should allow_mass_assignment_of(:cohort_id)}
    it {should allow_mass_assignment_of(:name)}
    it {should allow_mass_assignment_of(:linked_in)}
    it {should allow_mass_assignment_of(:email)}
    it {should allow_mass_assignment_of(:location)}
    it {should allow_mass_assignment_of(:employer)}
    it {should allow_mass_assignment_of(:picture)}
  end

  context "get_locations" do
      it "should return a nested array containing a number and a location name" do
        # grad = Graduate.new
      pending

      end
  end

  context "get_graduates" do
    let!(:graduate){FactoryGirl.create(:graduate)}
    it "should return a colleciton of graduates based on selected criteria" do
      expect(Graduate.get_graduates("San Francisco", "2014")).to include(Graduate.find_by_name("Tyler Waneka"))
    end
  end
end
