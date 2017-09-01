class TrainingType < ApplicationRecord
  belongs_to :crew
  has_many :trainings, dependent: :destroy
  has_many :specialties, dependent: :destroy
  #for the training picture attachments
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy
  #nested forms
  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :video_links, reject_if: :all_blank, allow_destroy: true
  attr_accessor :photo, :vignette

  def self.that_has_videos
    has_videos = []
    TrainingType.all.map { |t|
      if t.video != nil
       has_videos << t
      end
    }
    return has_videos
  end

  def photo
    #test on va changer eventuellement
    self.avatars.get_default.photo
  end

  def video
    #test on va changer eventuellement
    self.video_links.get_default
  end

  def duration
    if self.duration_minutes <= 0
      return "#{ self.duration_hours }hr"
    else
      return "#{ self.duration_hours }hr #{ self.duration_minutes }min"
    end
  end

end
