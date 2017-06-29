class CreateKickstarts < ActiveRecord::Migration[5.0]
  def change
    create_table :kickstarts do |t|
      t.references :coaches_crew, foreign_key: true
      t.references :crew, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
