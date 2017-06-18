class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.references :coaches_crew, foreign_key: true
      t.date :birth_date
      t.boolean :sex

      t.timestamps
    end
  end
end
