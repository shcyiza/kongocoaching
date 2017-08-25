class AddCrewReferencesToPlaceholder < ActiveRecord::Migration[5.0]
  def change
    add_reference :coach_placeholders, :crew, foreign_key: true
  end
end
