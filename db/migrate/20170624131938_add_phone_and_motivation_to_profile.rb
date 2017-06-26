class AddPhoneAndMotivationToProfile < ActiveRecord::Migration[5.0]
  change_table :profiles do |t|
    t.column :phonenr, :string
    t.column :motivation, :text
  end
end
