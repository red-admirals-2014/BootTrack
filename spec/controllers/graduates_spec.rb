  require "spec_helper"

  describe GraduatesController do
    context "#search" do
      it "gives success on good params" do
       get :search,  {campus: "San Francisco", year: "2014"}
       expect(response.status).to eq(200)
     end
     it "gives error on no params" do


      get :search
      expect(response.status).to eq(500)
    end
  end

  context "#locaion" do

  end

  context "#email" do

  end

end
