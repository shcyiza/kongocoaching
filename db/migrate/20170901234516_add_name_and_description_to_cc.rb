class AddNameAndDescriptionToCc < ActiveRecord::Migration[5.0]
  def change
    add_column :coaches_crews, :name, :string
    add_column :coaches_crews, :description, :text
    drop_table :coach_placeholders
  end
end
