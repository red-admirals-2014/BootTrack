class AlumniController < ApplicationController
  def index
  end

  def search
    redirect_to 'index', :status => :ok
  end
end
