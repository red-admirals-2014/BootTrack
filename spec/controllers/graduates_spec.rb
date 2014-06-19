  require "spec_helper"

describe GraduatesController do
  context "#search" do
    it "gives success on good params" do
       get :search,  {campus: "San Francisco", year: "2014"}
       expect(response.status).to eq(200)
    end
    it "gives error on bad params" do
      pending "There's no error condition built into the code"

       get :search,  {campus: "Chicago", year: "2012"}
       expect(response.status).to eq(404)
    end
  end
end