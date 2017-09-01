class CoachesCrew < ApplicationRecord
  belongs_to :coach
  belongs_to :crew
  has_many :profiles
  has_many :training, dependent: :destroy
  has_many :specialties, as: :specializable, dependent: :destroy

  #for the training picture attachments
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy

  #avoid that one coach can be assigned more than once to one crew
  validates :coach_id, uniqueness: { scope: :crew_id, if: :new_record?}

end
