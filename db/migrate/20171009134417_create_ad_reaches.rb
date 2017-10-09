class CreateAdReaches < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_reaches do |t|
      t.references :profile, foreign_key: true
      t.references :ad_medium, foreign_key: true
      t.integer :advertisable_id
      t.string :advertisable_type

      t.timestamps
    end
  end
end
