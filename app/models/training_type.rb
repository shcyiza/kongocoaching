class TrainingType < ApplicationRecord
  has_many :trainings

  #for the training picture attachments
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy
  accepts_nested_attributes_for :avatars
  accepts_nested_attributes_for :video_links

  def photo
    #test on va changer eventuellement
    self.avatars.first.photo
  end

  def video_link
    #test on va changer eventuellement
    self.video_links.first.video_path
  end

end
