class Coach < ApplicationRecord
  belongs_to :user
  has_many :coaches_crews, dependent: :destroy
  has_many :crews, through: :coaches_crews
  has_many :training, through: :coaches_crews
  has_many :avatars, as: :attachable, dependent: :destroy
  has_many :video_links, as: :watchable, dependent: :destroy
  has_many :specialties, as: :specializable, dependent: :destroy

  accepts_nested_attributes_for :specialties, reject_if: :all_blank, allow_destroy: true

  #nested forms
  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :video_links, reject_if: :all_blank, allow_destroy: true

  attr_accessor :photo_params, :vignette

  def photo
    #test on va changer eventuellement
    self.avatars.first.photo
  end

  def name
    self.user.name
  end

end
