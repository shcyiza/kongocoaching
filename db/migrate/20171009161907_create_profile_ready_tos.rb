class CreateProfileReadyTos < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_ready_tos do |t|
      t.references :profile, foreign_key: true
      t.boolean :work_on_diet
      t.boolean :work_physically
      t.boolean :work_on_lifestyle

      t.timestamps
    end
  end
end
