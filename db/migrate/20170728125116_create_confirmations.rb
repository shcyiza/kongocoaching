class CreateConfirmations < ActiveRecord::Migration[5.0]
  def change
    create_table :confirmations do |t|
      t.boolean :confirmed
      t.string :confirmable_type
      t.integer :confirmable_id

      t.timestamps
    end
  end
end
