require 'rails_helper'

RSpec.describe 'about pranav page' do
  let!(:photo_placer) { create(:photo_placer, place: 'about pranav') }
  let!(:pranav) { create(:pranav) }

  before do
    visit '/about_pranav'
  end

  it 'shows "about pranav" text' do
    expect(page).to have_content pranav.about
  end

  it 'shows "about pranav" image' do
    expect(page).to have_css('img#about_pranav_image')
  end
end
