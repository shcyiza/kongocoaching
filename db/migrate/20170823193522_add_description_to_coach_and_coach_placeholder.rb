class AddDescriptionToCoachAndCoachPlaceholder < ActiveRecord::Migration[5.0]
  def change
    add_column :coaches, :description, :text
    add_column :coach_placeholders, :description, :text
  end
end
