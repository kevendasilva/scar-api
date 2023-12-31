class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :key
      t.integer :key_type
      t.boolean :allowed
      t.references :door_lock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
