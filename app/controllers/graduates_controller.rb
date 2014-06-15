class GraduatesController < ApplicationController
  def index
  end

  def search
    campus = params[:campus]
    year = params[:year]
    graduates = get_graduates(campus, year)
    render json: { graduates: graduates }.to_json, :status => :ok
  end

  private

  def get_graduates(campus, year)
    p campus
    graduates = Graduate.joins(:cohort).select("graduates.*, cohorts.start_date as start_date, cohorts.location as location").order('start_date DESC').first(30) if campus=='default' && year=='default'
    graduates = Cohort.where(location: campus).joins(:graduates).select('cohorts.*,graduates.name as name').order('start_date DESC').first(30) if campus!='default' && year=='default'
    #graduat'es = Cohort.joins(:graduates).order('start_date DESC').where('extract(year  from start_date) = ?', year).limit(3) if campus=='default' && year!='default'
    #graduates = Cohort.joins(:graduates).order('start_date DESC').where(location: campus).where('extract(year  from start_date) = ?', year).limit(3) if campus!='default' && year!='default'
    return graduates
  end

end
