class CreateCoachesCrews < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches_crews do |t|
      t.integer :coach_id
      t.integer :crew_id

      t.timestamps
    end
  end
end
