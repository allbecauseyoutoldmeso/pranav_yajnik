require 'rails_helper'

RSpec.describe 'contact page' do
  let!(:photo_placer) { create(:photo_placer, place: 'contact') }
  let!(:pranav) { create(:pranav) }

  before do
    visit '/contact'
  end

  it 'shows facebook_url' do
    expect(page).to have_content pranav.facebook_url
  end

  it 'shows twitter_url' do
    expect(page).to have_content pranav.twitter_url
  end

  it 'shows telephone_number' do
    expect(page).to have_content pranav.telephone_number
  end

  it 'shows email_address' do
    expect(page).to have_content pranav.email_address
  end

  it 'shows contact image' do
    expect(page).to have_css('img#contact_image')
  end
end
