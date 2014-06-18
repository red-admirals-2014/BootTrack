class AddLatitudeAndLongitudeToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :latitude, :float
    add_column :graduates, :longitude, :float
  end
end
