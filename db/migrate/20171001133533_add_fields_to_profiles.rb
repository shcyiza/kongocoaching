class AddFieldsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :proffesion, :string
    add_column :profiles, :emergency_contact, :string
    add_column :profiles, :emergency_contact_relation, :string
    add_column :profiles, :emergency_contact_phone, :string
    add_column :profiles, :dr_name, :string
    add_column :profiles, :dr_phone, :string
  end
end
