class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :enrollable, polymorphic: true

  validates :user_id, uniqueness: { scope: :enrollable_id, if: :new_record?}
end
