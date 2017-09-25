class AddIsHqToClubCrew < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs_crews, :is_hq, :boolean, default: false
  end
end
