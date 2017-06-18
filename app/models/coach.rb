class Coach < ApplicationRecord
  belongs_to :user
  has_many :coaches_crews, dependent: :destroy
  has_many :crews, through: :coaches_crews
  has_many :training, through: :coaches_crews

  validates :user_id, uniqueness: true, if: :new_record?

end
