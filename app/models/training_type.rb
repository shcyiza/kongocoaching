class TrainingType < ApplicationRecord
  belongs_to :crew
  has_many :trainings, dependent: :destroy
  has_many :specialties, dependent: :destroy
  #DescriptibleModels is a module that contain all the inheritance of the models who has columns name, description and is attachable or watchable
  #attachable is the polymorphic owner of the avatar model and watchable of video_links
  include DescriptibleModels


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
    CoachesCrew.joins(:specialties).where("training_type_id = ?", self.id)
  end

end
