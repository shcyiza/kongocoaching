class TrainingType < ApplicationRecord
  has_many :trainings

  #for the training picture attachments
  has_attached_file :avatar, styles: { big: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :avatar, attachment_presence: true

end
