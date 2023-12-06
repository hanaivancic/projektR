class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.integer :coinNumber

      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
