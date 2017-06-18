class CreateProfileVariables < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_variables do |t|
      t.references :profile, foreign_key: true
      t.string :name
      t.decimal :variable

      t.timestamps
    end
  end
end
