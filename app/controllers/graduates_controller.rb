class GraduatesController < ApplicationController
  def index
  end

  def search
  # CR move get_graduates
    campus = params[:campus]
    year = params[:year]
    graduates = get_graduates(campus, year)
    render json: { graduates: graduates }.to_json, :status => :ok
  end

  private
# CR move the active record to the graduates model and the cohort model - maybe leave the combination here.  grad= get_grad(). ANNE REFACTOR.

  def get_graduates(campus, year)
    # CR refactor to rely more on active record methods instead of writing direct sql.
    graduates = Graduate.joins(:cohort).select("graduates.*, cohorts.start_date as start_date, cohorts.campus as campus").order('start_date DESC').first(300) if campus=='default' && year=='default'
    graduates = Cohort.where(campus: campus).joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').first(300) if campus!='default' && year=='default'
    graduates = Cohort.joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').where('extract(year  from start_date) = ?', year).limit(300) if campus=='default' && year!='default'
    graduates = Cohort.joins(:graduates).select('cohorts.*,graduates.name as name, graduates.picture as picture, graduates.employer as employer').order('start_date DESC').where(campus: campus).where('extract(year  from start_date) = ?', year).limit(300) if campus!='default' && year!='default'
    return graduates
  end

end
