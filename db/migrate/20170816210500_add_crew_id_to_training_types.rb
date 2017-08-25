class AddCrewIdToTrainingTypes < ActiveRecord::Migration[5.0]
  def change
    add_reference :training_types, :crew, foreign_key: true
  end
end
