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
    graduates = Graduate.joins(:cohort).select("graduates.*, cohorts.start_date as start_date, cohorts.campus as campus").order('start_date DESC').first(30) if campus=='default' && year=='default'
    graduates = Cohort.where(campus: campus).joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').first(30) if campus!='default' && year=='default'
    graduates = Cohort.joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').where('extract(year  from start_date) = ?', year).limit(30) if campus=='default' && year!='default'
    graduates = Cohort.joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').where(campus: campus).where('extract(year  from start_date) = ?', year).limit(30) if campus!='default' && year!='default'
    return graduates
  end

end
