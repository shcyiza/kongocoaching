module DescriptibleModels

  def self.included(base)
    base.has_many :avatars, as: :attachable, dependent: :destroy
    base.has_many :video_links, as: :watchable, dependent: :destroy
    base.accepts_nested_attributes_for :avatars, reject_if: :all_blank, allow_destroy: true
    base.accepts_nested_attributes_for :video_links, reject_if: :all_blank, allow_destroy: true
    attr_accessor :star_pic, :vignette
  end

  def self.that_has_videos
    has_videos = []
    self.class.all.map { |t|
      if t.video != nil
       has_videos << t
      end
    }
    return has_videos
  end

  def photo
    if self.avatars.has_default
      self.avatars.get_default.photo
    else
      self.avatars.first.photo
    end
  end

  def video
    #test on va changer eventuellement
    self.video_links.get_default
  end

  def get_name
    result = self.name
    if self.class.name == "CoachesCrew"
      if self.is_name_owner? == true
        result = self.coach.name
      end
    end
    return result
  end

  def get_description
    result = self.description
    if self.class.name == "CoachesCrew"
      if self.is_description_owner? == true
        result = self.coach.description
      end
    end
    return result
  end

  def html_description
    if self.get_description != nil
      ActionController::Base.helpers.sanitize(self.description)
    end
  end

end
