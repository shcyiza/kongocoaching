module KongoCoachingPagesHelper

  def show_his_pic_or_default attachable, *classes
    if attachable.avatars.count != 0
      image_tag attachable.photo.url(:medium), class: classes
    else
      image_tag "https://irontrainer.co/wp-content/uploads/2017/01/personal-trainer-demonstrating-squat-lLas-Vegas-256x256.jpg", class: classes
    end
  end

end
