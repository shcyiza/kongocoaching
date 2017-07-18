class TrainingType < ApplicationRecord
  has_many :trainings

  #for the training picture attachments
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy
  accepts_nested_attributes_for :avatars
  accepts_nested_attributes_for :video_links


end
