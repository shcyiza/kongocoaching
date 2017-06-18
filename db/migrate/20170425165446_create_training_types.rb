class CreateTrainingTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :training_types do |t|
      t.string :type
      t.text :description
      t.integer :duration_hours
      t.integer :duration_minutes

      t.timestamps
    end
  end
end
