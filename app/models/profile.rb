class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :crew
  belongs_to :coaches_crew, optional: true
  has_many :profile_variables, dependent: :destroy

  validates :user_id, uniqueness: true, if: :new_record?

end
