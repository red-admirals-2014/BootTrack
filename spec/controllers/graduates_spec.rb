require "spec_helper"

describe "graduates_controller" do
  it "#search" do
    get "/graduates/search", {location: "San Francisco", year: "2014"}
    expect(response.status).to eq(200)
  end
end