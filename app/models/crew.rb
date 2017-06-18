class Crew < ApplicationRecord
  belongs_to :coordinator
  has_many :profiles
  has_many :coaches_crews, dependent: :destroy
  has_many :coaches, through: :coaches_crews
  has_many :training, through: :coaches_crews

  accepts_nested_attributes_for :coaches, allow_destroy: true
  
end
