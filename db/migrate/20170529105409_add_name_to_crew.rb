class AddNameToCrew < ActiveRecord::Migration[5.0]
  def change
    add_column :crews, :name, :string
  end
end
