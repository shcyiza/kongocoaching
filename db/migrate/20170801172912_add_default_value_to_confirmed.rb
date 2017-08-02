class AddDefaultValueToConfirmed < ActiveRecord::Migration[5.0]
  def change
    change_column_default :confirmations, :confirmed, false
  end
end
