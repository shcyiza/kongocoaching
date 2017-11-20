class ProfileIdealSheduling < ProfileSubModels
  validates_inclusion_of :weekday, in: 1..7, if: proc { |x| x.weekday.present? }
  validates_inclusion_of :dayperiod, in: 0..4, if: proc { |x| x.dayperiod.present? }
end
