require "spec_helper"

describe Graduate do
  it "name should equal Kelley Puckett" do
  grad = Graduate.new
  grad.name = "Kelley Puckett"
  grad.email = "kelley@comics.com"
  grad.save
  expect(grad.reload.name).to eq "Kelley Puckett"
end
end