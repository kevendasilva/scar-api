class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates do |t|
      t.integer :key_type
      t.string :person_name
      t.boolean :open
      t.references :door_lock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
