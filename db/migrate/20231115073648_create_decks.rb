class CreateDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.references :student, foreign_key: true
      t.references :classroom, foreign_key: true
      t.timestamps
    end
  end
end
