class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|

      t.timestamps
    end
  end
end
