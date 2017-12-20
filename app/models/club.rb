class Club < ApplicationRecord
  has_many :clubs_crews, dependent: :destroy
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :social_links, as: :socializable, dependent: :destroy
  accepts_nested_attributes_for :avatars, allow_destroy: true
  accepts_nested_attributes_for :social_links, allow_destroy: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
