require 'rails_helper'

RSpec.describe 'home page' do
  let!(:home_photo_placer) { create(:photo_placer, place: 'home') }
  let!(:mobile_home_photo_placer) { create(:photo_placer, place: 'mobile home') }
  let!(:pranav) { create(:pranav) }

  before do
    visit '/'
  end

  it 'shows home page image' do
    expect(page).to have_css('img#home_image')
  end

  it 'shows mobile home page image' do
    expect(page).to have_css('img#mobile_home_image')
  end
end
