class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.integer :coach_id
      t.integer :training_type_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
