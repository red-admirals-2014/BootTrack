class AddEmployerToGraduates < ActiveRecord::Migration
  def change
    add_column :graduates, :employer, :string
  end
end
