class CreateCrews < ActiveRecord::Migration[5.0]
  def change
    create_table :crews do |t|
      t.integer :coordinator_id

      t.timestamps
    end
  end
end
