class Coordinator < ApplicationRecord
  belongs_to :user
  has_many :crews, dependent: :destroy
  has_many :coaches_crews, dependent: :destroy

  validates :user_id, uniqueness: true, if: :new_record?
end