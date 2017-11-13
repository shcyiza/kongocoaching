class AdReach < ProfileSubModels
  belongs_to :ad_medium, optional: true
  belongs_to :advertisable, polymorphic: true, optional: true
end
