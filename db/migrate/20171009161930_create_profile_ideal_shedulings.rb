class CreateProfileIdealShedulings < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_ideal_shedulings do |t|
      t.references :profile, foreign_key: true
      t.integer :weekday
      t.integer :dayperiod

      t.timestamps
    end
  end
end
