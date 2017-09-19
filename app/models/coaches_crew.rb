class CoachesCrew < ApplicationRecord
  belongs_to :coach, optional: true
  belongs_to :crew
  has_many :profiles #there so a coach can be set as default to many users
  has_many :trainings, dependent: :destroy
  has_many :specialties, as: :specializable, dependent: :destroy
  has_many :training_types, through: :specialties
  #DescriptibleModels is a module that contain all the inheritance of the models who has columns name, description and is attachable or watchable
  #attachable is the polymorphic owner of the avatar model and watchable of video_links
  include DescriptibleModels
  
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
