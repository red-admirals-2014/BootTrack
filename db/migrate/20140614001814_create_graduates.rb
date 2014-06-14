class CreateGraduates < ActiveRecord::Migration

  def change
    create_table :graduates do |t|
      t.references :cohort
      t.string :name
      t.string :email
      t.text :linked_in
      t.timestamps
    end
  end

end
