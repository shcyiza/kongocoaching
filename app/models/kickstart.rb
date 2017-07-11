class Kickstart < ApplicationRecord
  belongs_to :coaches_crew, optional: true
  belongs_to :crew
  has_one :participant, as: :enrollable
  extend TimeSplitter::Accessors
  split_accessor :start_time

  def confirmed?
    result = false
    if self.created_at != self.updated_at
      result = true
    end
    return result
  end
end
