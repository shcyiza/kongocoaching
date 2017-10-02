class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :crew
  belongs_to :coaches_crew, optional: true
  has_many :profile_variables, dependent: :destroy

  validates :user_id, uniqueness: true, if: :new_record?
  has_many :avatars, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :avatars

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


end
