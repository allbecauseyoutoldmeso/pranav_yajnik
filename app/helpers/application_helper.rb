module ApplicationHelper

  def photo_placer_button_class(photo_placer, photo)
    photo_placer.photo == photo ? 'selected_photo_button' : 'admin_button'
  end

  def hide_photo_button_class(photo)
    photo.hidden ? 'selected_photo_button' : 'admin_button'
  end

  def video(item)
    item.is_a?(Video)
  end

  def visible_photo(item)
    item.is_a?(Photo) && visible(item)
  end

  def visible(photo)
    photo.shown || admin_signed_in?
  end
end
