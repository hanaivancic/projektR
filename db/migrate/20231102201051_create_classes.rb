class CreateClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :classes do |t|
      t.string :name
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
