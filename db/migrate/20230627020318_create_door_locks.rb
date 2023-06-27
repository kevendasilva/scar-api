class CreateDoorLocks < ActiveRecord::Migration[7.0]
  def change
    create_table :door_locks do |t|
      t.string :name
      t.boolean :open
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
