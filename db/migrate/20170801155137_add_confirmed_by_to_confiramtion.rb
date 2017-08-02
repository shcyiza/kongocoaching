class AddConfirmedByToConfiramtion < ActiveRecord::Migration[5.0]
  def change
    add_column :confirmations, :confirmed_by, :string
  end
end
