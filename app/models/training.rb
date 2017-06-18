class Training < ApplicationRecord
  belongs_to :training_type
  belongs_to :coaches_crew
  has_many :participants
  has_many :users, through: :participants

end
