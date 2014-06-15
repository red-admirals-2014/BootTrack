class FixLocationName < ActiveRecord::Migration
  def change
    rename_column :cohorts, :location, :campus
  end
end
