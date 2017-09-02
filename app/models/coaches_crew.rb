class CoachesCrew < ApplicationRecord
  belongs_to :coach, optional: true
  belongs_to :crew
  has_many :profiles #there so a coach can be set as default to many users
  has_many :training, dependent: :destroy
  has_many :specialties, as: :specializable, dependent: :destroy
  #for the training picture attachments
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy
  #nested forms
  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :video_links, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :specialties, reject_if: :all_blank, allow_destroy: true
  #avoid that one coach can be assigned more than once to one crew
  validates :coach_id, uniqueness: { scope: :crew_id, if: :new_record?}

  attr_accessor :photo, :vignette

  def photo
    self.avatars.get_default.photo
  end

end
