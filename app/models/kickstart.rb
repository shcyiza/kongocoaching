class Kickstart < ApplicationRecord
  belongs_to :coaches_crew, optional: true
  belongs_to :crew
  has_one :participant, as: :enrollable, dependent: :destroy
  has_one :confirmation, as: :confirmable, dependent: :destroy
  extend TimeSplitter::Accessors
  split_accessor :start_time

  def is_confirmed?
    result = false
    if self.confirmation.confirmed
      result = true
    end
    return result
  end

  def self.all_confirmed
    Confirmation.where(confirmed: true, confirmable_type: "Kickstart").map{|k| k.confirmable}
  end

  def self.all_unconfirmed
    Confirmation.where(confirmed: false, confirmable_type: "Kickstart").map{|k| k.confirmable}
  end

  def is_confirmable?
    result = false
    if self.confirmation
      result = true
    end
    return result
  end

  def user
    self.participant.user
  end

  def self.set_all_as_confirmable
    Kickstart.all.each do |k|
      if k.is_confirmable? == false
        Confirmation.create! confirmable: k
      end
    end
  end

end
