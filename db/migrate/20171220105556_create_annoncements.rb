class CreateAnnoncements < ActiveRecord::Migration[5.0]
  def change
    create_table :annoncements do |t|
      t.references :crew, foreign_key: true
      t.string :titel
      t.string :cta
      t.text :description
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
