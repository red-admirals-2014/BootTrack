class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
      t.string :name
      t.string :email
      t.string :linked_in
      t.string :campus
      t.date :year
      t.string :job_title
      t.string :company
    end
  end
end
