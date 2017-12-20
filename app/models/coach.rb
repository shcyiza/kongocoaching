class Coach < ApplicationRecord
  belongs_to :user
  has_many :coaches_crews, dependent: :destroy
  has_many :crews, through: :coaches_crews
  has_many :training, through: :coaches_crews
  has_many :specialties, as: :specializable, dependent: :destroy
  has_many :social_links, as: :socializable, dependent: :destroy
  #DescriptibleModels is a module that contain all the inheritance of the models who has columns name, description and is attachable or watchable
  #attachable is the polymorphic owner of the avatar model and watchable of video_links
  include DescriptibleModels
  #nested forms
  accepts_nested_attributes_for :specialties, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :social_links, allow_destroy: true

  def name
    self.user.name
  end

end
