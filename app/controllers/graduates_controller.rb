class GraduatesController < ApplicationController
  include ApplicationHelper
  def index
  end

  def search
    graduates = Graduate.get_graduates(params[:campus], params[:year])
    cookies[:search_year] = params[:year]
    cookies[:search_campus] = params[:campus]
    render json: { graduates: graduates }.to_json, :status => :ok
  end

  def locations
    locations = Graduate.get_locations(cookies[:search_campus], cookies[:search_year])
    render json: {locations: locations}.to_json
  end

  def email
    @grad = Graduate.find(params["id"].to_i)
    AlumMailer.contact_attempt(@grad, params["user_name"], params["user_email"], params["message"]).deliver
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def by_location
    location = (params[:location]).gsub!(/, Number of Boots: .*/, '')
    graduates = Graduate.by_location(params[:location])
    render json: {graduates: graduates}
  end

  def update
    if params[:key] == 'ohcaptainmycaptain'
      render :text => "seeding"
      ApplicationHelper.update_all_linked_in
    else
      render :text => "Failed"
    end
  end

end
