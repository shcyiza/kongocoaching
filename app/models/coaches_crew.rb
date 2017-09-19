class CoachesCrew < ApplicationRecord
  belongs_to :coach, optional: true
  belongs_to :crew
  has_many :profiles #there so a coach can be set as default to many users
  has_many :trainings, dependent: :destroy
  has_many :specialties, as: :specializable, dependent: :destroy
  has_many :training_types, through: :specialties
  #for the training picture attachments
  include DescriptibleModels
  #nested forms
  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :video_links, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :specialties, reject_if: :all_blank, allow_destroy: true
  #avoid that one coach can be assigned more than once to one crew
  validates_presence_of :coach, if: :validate_new_cc?
  validates :crew_id, uniqueness: { scope: :coach_id, if: :validate_new_cc?}

  def is_name_owner?
    result = false
    if self.name == nil && self.coach
      unless self.coach.name == nil
        result = true
      end
    end
    return result
  end

  def is_description_owner?
    result = false
    if self.description == nil && self.coach
      unless self.coach.description == nil
        result = true
      end
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
