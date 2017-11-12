class Pranav < ActiveRecord::Base

  def has_twitter_url?
    twitter_url && twitter_url != ''
  end

  def has_facebook_url?
    facebook_url && facebook_url != ''
  end

  def has_email_address?
    email_address && email_address != ''
  end

  def has_telephone_number?
    telephone_number && telephone_number != ''
  end

end
