class GraduatesController < ApplicationController
  def index
  end

  def search
    campus = params[:campus]
    year = params[:year]
    get_graduates(campus, year)
    render json: { graduates: graduates }.to_json, :status => :ok
  end

  private

  def get_graduates(campus, year)
    graduates = Graduate.all if campus=='default' && year=='default'
    graduates = Graduate.where(campus: campus) if campus!='default' && year=='default'
    graduates = Graduate.where(year: year) if campus=='default' && year!='default'
    graduates = Graduate.where(year: year, campus: campus) if campus=='default' && year!='default'
    return graduates
  end

end
