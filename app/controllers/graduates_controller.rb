class GraduatesController < ApplicationController
  def index
  end

  def search
    graduates = Graduate.get_graduates(params[:campus], params[:year])
    locations = Graduate.get_locations(graduates)
    render json: { graduates: graduates, pins: locations }.to_json, :status => :ok
  end

  def email
    @grad = Graduate.find(params["id"])
    AlumMailer.contact_attempt(@grad, params["user_name"], params["user_email"], params["message"]).deliver
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

end
