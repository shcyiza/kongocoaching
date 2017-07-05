class Club < ApplicationRecord
  has_many :clubs_crews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode,if: :address_changed?

end
