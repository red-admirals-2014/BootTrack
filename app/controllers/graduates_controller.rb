class GraduatesController < ApplicationController
  def index
  end

  def search
    graduates = Graduate.all
    render json: { graduates: graduates }.to_json, :status => :ok
  end
end
