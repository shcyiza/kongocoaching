class TrainingType < ApplicationRecord
  belongs_to :crew
  has_many :trainings, dependent: :destroy
  has_many :specialties, dependent: :destroy
  #for the training picture attachments
  include DescriptibleModels
  #nested forms
  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :video_links, reject_if: :all_blank, allow_destroy: true

  def duration
    result = "#{ self.duration_hours }hr #{ self.duration_minutes }min"
    if self.duration_minutes == nil
      result = "#{ self.duration_hours }hr"
    elsif self.duration_hours == nil
      result = "#{ self.duration_minutes }min"
    end
    return result
  end

  def its_coaches
    self.specialties.map { |s| s.specializable }
  end

end
