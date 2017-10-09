class AdReach < ApplicationRecord
  belongs_to :profile
  belongs_to :ad_medium
  belongs_to :advertisable, polymorphic: true, optional: true
end
