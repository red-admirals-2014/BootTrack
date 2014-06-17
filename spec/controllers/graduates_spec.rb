  require "spec_helper"

describe GraduatesController do
  context "#search" do
    it "gives success on good params" do
       get :search,  {campus: "San Francisco", year: "2014"}
       expect(response.status).to eq(200)
    end
    xit "gives error on bad params" do
       get :search,  {campus: "Chicago", year: "2012"}
       expect(response.status).to eq(404)
    end
  end
end