class AlumniController < ApplicationController
  def index
  end

  def search
    alumni = Alumni.all
    render json: { alumni: alumni }.to_json, :status => :ok
  end
end
