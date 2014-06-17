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
end
