class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :ownableType
      t.integer :ownableId

      t.timestamps
    end
  end
end
