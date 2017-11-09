class ProfileShapeSatifaction < ProfileSubModels
  validates_inclusion_of :current_activity_frequency, in: 1..5
  validates_inclusion_of :shape_rating, in: 1..10
end
