class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
      t.string :name
      t.string :email
      t.string :location
      t.string :current_employer
      t.timestamps
    end
  end
end
