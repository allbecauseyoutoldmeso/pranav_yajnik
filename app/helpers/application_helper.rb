module ApplicationHelper

  def photo_placer_button_class(photo_placer, photo)
    photo_placer.photo == photo ? 'selected_photo_button' : 'admin_button' 
  end
end
