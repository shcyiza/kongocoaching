class Specialty < ApplicationRecord
  belongs_to :training_type
  belongs_to :specializable, polymorphic: true, optional: true
  validates :training_type_id, presence: true, allow_blank: false

  def name
    self.training_type.name
  end
end
