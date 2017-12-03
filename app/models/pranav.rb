class Pranav < ActiveRecord::Base

  def has_twitter_url?
    twitter_url.present? && twitter_url != ''
  end

  def has_facebook_url?
    facebook_url.present? && facebook_url != ''
  end

  def has_email_address?
    email_address.present? && email_address != ''
  end

  def has_telephone_number?
    telephone_number.present? && telephone_number != ''
  end

  def twitter_link
    "https://www.twitter.com/#{twitter_url}"
  end

  def facebook_link
    "https://www.facebook.com/#{facebook_url}"
  end

  def email_link
    "mailto:#{email_address}?Subject=Kathak%20lessons"
  end

  def telephone_link
    "tel:#{telephone_number}"
  end
end
