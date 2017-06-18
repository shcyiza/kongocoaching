class CoachesCrew < ApplicationRecord
  belongs_to :coach
  belongs_to :crew
  has_many :profiles
  has_many :training, dependent: :destroy
  #avoid that one coach can be assigned more than once to one crew
  validates :coach_id, uniqueness: { scope: :crew_id, if: :new_record?}

end
