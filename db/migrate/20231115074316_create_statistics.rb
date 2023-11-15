class CreateStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.integer :questionNumber
      t.integer :correctNumber
      t.integer :halfNumber
      t.integer :incorrectNumber

      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
