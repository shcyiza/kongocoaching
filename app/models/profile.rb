class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :crew
  belongs_to :coaches_crew, optional: true

  has_many :profile_variables, dependent: :destroy, dependent: :destroy
  has_many :profile_kids_infos, dependent: :destroy, dependent: :destroy
  has_many :profile_shape_satifactions, dependent: :destroy
  has_one :profile_ready_to, dependent: :destroy
  has_many :profile_ideal_schedulings, dependent: :destroy

  has_many :ad_reaches, dependent: :destroy
  has_many :avatars, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :profile_kids_infos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :profile_shape_satifactions, reject_if: :all_blank , reject_if: :check_if_same_as_last, allow_destroy: true
  accepts_nested_attributes_for :profile_ready_to, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :profile_ideal_schedulings, reject_if: :all_blank, allow_destroy: true
  validates :user_id, uniqueness: true, if: :new_record?
  attr_accessor :has_kids

  geocoded_by :address, latitude: :latitude, longitude: :longitude
  geocoded_by :proffession_address, latitude: :proffession_latitude, longitude: :proffession_longitude
  after_validation :geocode, if: :address_changed?
  after_validation :geocode, if: :proffession_address_changed?

  def kids
    self.profile_kids_infos.order('birthyear ASC')
  end

  def find_or_initialize_ready_to
    if self.profile_ready_to != nil
      self.profile_ready_to
    else
      ProfileReadyTo.new(profile: self)
    end
  end

  def initialize_shape_satifaction
    if self.profile_shape_satifactions.count > 0
      last_saved = self.profile_shape_satifactions.last
      return ProfileShapeSatifaction.new( profile: self,
        shape_rating: last_saved.shape_rating,
        shape_satification: last_saved.shape_satification,
        current_activity_frequency: last_saved.current_activity_frequency
      )
    else
      ProfileShapeSatifaction.new(profile: self)
    end
  end

  def check_if_same_as_last attributes
    result = false
    if self.profile_shape_satifactions.count > 0
      last_saved = self.profile_shape_satifactions.last
      if attributes['shape_rating'].to_i == last_saved.shape_rating && (attributes['shape_satification'].to_i == 1) == last_saved.shape_satification && attributes['current_activity_frequency'].to_i == last_saved.current_activity_frequency.to_i
        result = true
      end
    end
    binding.pry
    return result
  end

end
