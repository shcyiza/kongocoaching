class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :crew
  belongs_to :coaches_crew, optional: true

  has_many :profile_variables, dependent: :destroy, dependent: :destroy
  has_many :profile_kids_infos, dependent: :destroy, dependent: :destroy
  has_many :profile_shape_satifactions, dependent: :destroy
  has_many :profile_ready_tos, dependent: :destroy
  has_many :profile_ideal_schedulings, dependent: :destroy

  has_many :ad_reaches, dependent: :destroy
  has_many :avatars, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :profile_kids_infos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :profile_shape_satifactions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :profile_ready_tos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :profile_ideal_schedulings, reject_if: :all_blank, allow_destroy: true
  validates :user_id, uniqueness: true, if: :new_record?
  attr_accessor :has_kids

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


end
