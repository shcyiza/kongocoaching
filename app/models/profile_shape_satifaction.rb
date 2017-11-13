class ProfileShapeSatifaction < ProfileSubModels
  validates_inclusion_of :current_activity_frequency, in: 1..4, if: proc { |x| x.current_activity_frequency.present? }
  validates_inclusion_of :shape_rating, in: 1..10, if: proc { |x| x.shape_rating.present? }
end
