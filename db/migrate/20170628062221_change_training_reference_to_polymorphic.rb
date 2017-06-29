class ChangeTrainingReferenceToPolymorphic < ActiveRecord::Migration[5.0]
  def change
    rename_column :participants, :traning_id, :enrollable_id
    add_column :participants, :enrollable_type, :string
  end
end
