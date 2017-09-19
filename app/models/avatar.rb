class Avatar < Multimedia
  belongs_to :attachable, polymorphic: true, optional: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>", hero:"500x500<" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


  def get_attachable_default #instance methode unlike get_default
    self.attachable.avatars.get_default
  end

  def set_as_default
    self.attachable.avatars.update_all(is_default: false)
    self.update(is_default: true)
  end

end
