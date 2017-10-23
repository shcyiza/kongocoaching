class AddGeocodeToProfileProfessionAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :proffession_latitude, :float
    add_column :profiles, :proffession_longitude, :float
  end
end
