class CreateClubsCrews < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs_crews do |t|
      t.references :club, foreign_key: true
      t.references :crew, foreign_key: true

      t.timestamps
    end
  end
end
