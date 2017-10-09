class ProfileSubModels < ActiveRecord::Base
  self.abstract_class = true
  belongs_to :profile
end
