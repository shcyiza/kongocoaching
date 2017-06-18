class RenameCoachIdToCoachCrewId < ActiveRecord::Migration[5.0]
  def change
    rename_column :trainings, :coach_id, :coaches_crew_id
  end
end
