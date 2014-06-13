require "spec_helper"

describe "alumni_controller" do
  it "#search" do
    get "/alumni/search", {location: "San Francisco", year: "2014"}
    expect(response.status).to eq(200)
  end
end