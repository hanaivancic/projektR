class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.references :owned, polymorphic: true, index: true
      t.timestamps
    end
  end
end
