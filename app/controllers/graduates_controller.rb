class GraduatesController < ApplicationController
  def index
  end

  def search
    graduates = Graduate.get_graduates(params[:campus], params[:year])
    locations = Graduate.get_locations(graduates)
    render json: { graduates: graduates, pins: locations }.to_json, :status => :ok
  end

end
