class CorrectionSpecializableId < ActiveRecord::Migration[5.0]
  def change
    rename_column :specialties, :spacializable_id, :specializable_id
  end
end
