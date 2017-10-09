class AdMedium < ApplicationRecord
  belongs_to :ad_category
  has_many :ad_reaches
end
