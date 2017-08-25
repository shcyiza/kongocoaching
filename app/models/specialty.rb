class Specialty < ApplicationRecord
  belongs_to :training_type
  belongs_to :specializable, polymorphic: true, optional: true
end
