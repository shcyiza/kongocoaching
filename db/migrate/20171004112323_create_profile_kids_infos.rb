class CreateProfileKidsInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_kids_infos do |t|
      t.references :profile, foreign_key: true
      t.string :birthyear
      t.timestamps
    end
  end
end
