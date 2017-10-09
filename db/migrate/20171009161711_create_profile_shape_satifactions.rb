class CreateProfileShapeSatifactions < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_shape_satifactions do |t|
      t.references :profile, foreign_key: true
      t.integer :shape_rating
      t.boolean :shape_satification
      t.integer :current_activity_frequency

      t.timestamps
    end
  end
end
