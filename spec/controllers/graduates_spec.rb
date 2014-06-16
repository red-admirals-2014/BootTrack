require "spec_helper"

describe GraduatesController do
  context "#search" do
    it "gives success on good params" do
       get :search,  {location: "San Francisco", year: "2014"}
       expect(response.status).to eq(200)
    end
    it "gives error on bad params" do
       get :search,  {location: "Chicago", year: "2012"}
       expect(response.body).to have('error')
    end
  end
end
