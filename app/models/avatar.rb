class Avatar < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>", hero:"500x500<" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  scope :current_defaults, -> { where(is_default: true) }

  class << self
    #class methode meant to be called with attachable
    #done this way so it can be called from any polymorphic owner
    def has_default
      result = false
      if self.current_defaults
        result = true
      end
      return result
    end
  end

  class << self
    #class methode meant to be called with attachable
    #done this way so it can be called from any polymorphic owner
    def get_default
      if self.current_defaults
        self.current_defaults.first
      else
        raise 'Cette instance ne possède de avatar par default'
      end
    end
  end

  def get_attachable_default #instance methode unlike get_default
    self.attachable.avatars.get_default
  end

  def set_as_default
    self.attachable.avatars.update_all(is_default: false)
    self.update(is_default: true)
  end

end
