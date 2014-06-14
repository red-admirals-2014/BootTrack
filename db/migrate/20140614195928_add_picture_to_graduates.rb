class AddPictureToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :picture, :string
  end
end
