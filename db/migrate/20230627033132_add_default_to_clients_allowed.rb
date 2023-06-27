class AddDefaultToClientsAllowed < ActiveRecord::Migration[7.0]
  def up
    change_column_default :clients, :allowed, from: nil, to: false
  end

  def down
    change_column_default :clients, :allowed, from: false, to: nil
  end
end
