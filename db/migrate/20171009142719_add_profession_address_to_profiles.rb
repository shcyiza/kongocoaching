class AddProfessionAddressToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :proffession_address, :string
  end
end
