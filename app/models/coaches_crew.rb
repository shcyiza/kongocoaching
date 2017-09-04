class CoachesCrew < ApplicationRecord
  belongs_to :coach, optional: true
  belongs_to :crew
  has_many :profiles #there so a coach can be set as default to many users
  has_many :trainings, dependent: :destroy
  has_many :specialties, as: :specializable, dependent: :destroy
  has_many :training_types, through: :specialties
  #for the training picture attachments
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy
  #nested forms
  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :video_links, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :specialties, reject_if: :all_blank, allow_destroy: true
  #avoid that one coach can be assigned more than once to one crew
  validates_presence_of :coach, if: :validate_new_cc?
  validates :crew_id, uniqueness: { scope: :coach_id, if: :validate_new_cc?}

  attr_accessor :photo, :vignette

  def photo
    self.avatars.get_default.photo
  end

  def video
    #test on va changer eventuellement
    self.video_links.get_default
  end

  def is_owner_name?
    result = false
    if self.name == nil && self.coach
      unless self.coach.name == nil
        result = true
      end
    end
    return result
  end

  def is_owner_description?
    result = false
    if self.description == nil && self.coach
      unless self.coach.description == nil
        result = true
      end
    end
    return result
  end

  def get_name
    result = self.name
    if self.is_owner_name? == true
      result = self.coach.name
    end
    return result
  end

  def get_description
    result = self.description
    if self.is_owner_description? == true
      result = self.coach.description
    end
    return result
  end

  private
    def validate_new_cc?
      result = false
      if self.new_record? && self.coach_id != nil
        result = true
      end
      return result
    end
end
