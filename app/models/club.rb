class Club < ApplicationRecord
  has_many :clubs_crews, dependent: :destroy
  has_many :avatars, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :avatars

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
