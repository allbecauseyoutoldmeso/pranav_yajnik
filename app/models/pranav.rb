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
end
