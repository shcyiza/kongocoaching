class CreateSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :specialties do |t|
      t.references :training_type, foreign_key: true
      t.integer :spacializable_id
      t.string :specializable_type

      t.timestamps
    end
  end
end
