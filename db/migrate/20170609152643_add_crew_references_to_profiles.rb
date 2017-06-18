class AddCrewReferencesToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :crew, foreign_key: true
  end
end
