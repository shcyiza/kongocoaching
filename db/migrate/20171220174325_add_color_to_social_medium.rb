class AddColorToSocialMedium < ActiveRecord::Migration[5.0]
  def change
    add_column :social_media, :color, :string
  end
end
