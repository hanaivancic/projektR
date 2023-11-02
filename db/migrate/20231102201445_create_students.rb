class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name

      t.references :class, foreign_key: true

      t.timestamps
    end
  end
end
