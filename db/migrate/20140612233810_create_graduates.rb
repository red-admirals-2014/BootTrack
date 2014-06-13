class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :name
      t.string :email
      t.string :linked_in
      t.string :campus
      t.date :year
      t.string :job_title
      t.string :company
      t.timestamps
    end
  end
end
