class Multimedia < ActiveRecord::Base
  self.abstract_class = true
  scope :current_defaults, -> { where(is_default: true) }

  class << self
    #class methode meant to be called with attachable
    #done this way so it can be called from any polymorphic owner
    def has_default
      result = false
      if self.current_defaults.count > 0
        result = true
      end
      return result
    end

    #class methode meant to be called with attachable
    #done this way so it can be called from any polymorphic owner
    def get_default
      if self.current_defaults
        self.current_defaults.first
      else
        raise "Cette instance ne possède de #{self.class.name} par default"
      end
    end
  end

end
