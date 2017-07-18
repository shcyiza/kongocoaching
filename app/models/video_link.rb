class VideoLink < ApplicationRecord
  belongs_to :watchable, polymorphic: true
end
