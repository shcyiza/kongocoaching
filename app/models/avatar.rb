class Avatar < ApplicationRecord
  belongs_to :attachable, polymorphic: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>", hero:"500x500<" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
