class AddDefaultToDoorLocksOpen < ActiveRecord::Migration[7.0]
  def up
    change_column_default :door_locks, :open, from: nil, to: false
  end

  def down
    change_column_default :door_locks, :open, from: false, to: nil
  end
end
