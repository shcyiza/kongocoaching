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

  def photo
    #test on va changer eventuellement
    self.avatars.first.photo
  end

  def video
    #test on va changer eventuellement
    self.video_links.first
  end

end
