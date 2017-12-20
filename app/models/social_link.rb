class SocialLink < ApplicationRecord
  belongs_to :social_medium
  belongs_to :socializable, polymorphic: true
end
