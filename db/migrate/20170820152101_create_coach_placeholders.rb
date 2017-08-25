class CreateCoachPlaceholders < ActiveRecord::Migration[5.0]
  def change
    create_table :coach_placeholders do |t|
      t.string :name

      t.timestamps
    end
  end
end
