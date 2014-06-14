class AddLocationToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :location, :string
  end
end
