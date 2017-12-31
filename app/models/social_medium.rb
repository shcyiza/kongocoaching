class SocialMedium < ApplicationRecord
  has_many :social_links, dependent: :destroy

end
