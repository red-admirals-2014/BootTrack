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

  context "#locations" do
    it "should return a list of locations" do
      get :locations
      expect(response.status).to eq(200)
    end
  end

  context "#email" do

  end

  context "#by_location" do
    it "should render a group of boots by location with good params" do
      get :by_location, {location: "other"}
    expect(response.status).to eq(200)
  end
    it "should return an error with bad params" do
      pending "need to build a 404 template for this to work"
      get :by_location
      expect(response.status).to eq(404)
    end
  end

end
