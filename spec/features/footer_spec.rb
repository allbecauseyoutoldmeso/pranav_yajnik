require 'rails_helper'

RSpec.describe 'footer' do
  let!(:home_photo_placer) { create(:photo_placer, place: 'home') }
  let!(:mobile_home_photo_placer) { create(:photo_placer, place: 'mobile home') }
  let!(:pranav) { create(:pranav) }

  before do
    visit '/'
  end

  it 'facebook link is present' do
    expect(page).to have_link('', href: "https://www.facebook.com/#{pranav.facebook_url}")
  end

  it 'twitter link is present' do
    expect(page).to have_link('', href: "https://www.twitter.com/#{pranav.twitter_url}")
  end

  it 'telephone number link is present' do
    expect(page).to have_link('', href: "tel:#{pranav.telephone_number}")
  end

  it 'email link is present' do
    expect(page).to have_link('', href: "mailto:#{pranav.email_address}?Subject=Kathak%20lessons")
  end
end
