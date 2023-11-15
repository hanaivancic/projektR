class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :lastName

      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
