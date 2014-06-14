require "spec_helper"

describe GraduatesController do
  it "#search" do
     get :search  {location: "San Francisco", year: "2014"}
     expect(response.status).to eq(200)
  end
end