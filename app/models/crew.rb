class Crew < ApplicationRecord
  belongs_to :coordinator
  has_many :profiles
  has_many :clubs_crews, dependent: :destroy
  has_many :clubs, through: :clubs_crews
  has_many :coaches_crews, dependent: :destroy
  has_many :coaches, through: :coaches_crews
  has_many :training, through: :coaches_crews
  has_many :kickstarts, dependent: :destroy
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy
  accepts_nested_attributes_for :avatars
  accepts_nested_attributes_for :video_links
  accepts_nested_attributes_for :coaches, allow_destroy: true

  def owner
    self.coordinator.user
  end

  def club
    self.clubs.first
  end
end
