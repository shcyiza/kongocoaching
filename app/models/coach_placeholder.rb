class CoachPlaceholder < ApplicationRecord
  belongs_to :crew
  has_many :specialties, as: :specializable, dependent: :destroy
  #for the training picture attachments
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy
  #nested forms
  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :video_links, reject_if: :all_blank, allow_destroy: true

  attr_accessor :photo_params

  def photo
    #test on va changer eventuellement
    self.avatars.first.photo
  end

end
