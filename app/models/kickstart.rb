class Kickstart < ApplicationRecord
  belongs_to :coaches_crew, optional: true
  belongs_to :crew
  has_one :participant, as: :enrollable
  extend TimeSplitter::Accessors
  split_accessor :start_time
end
