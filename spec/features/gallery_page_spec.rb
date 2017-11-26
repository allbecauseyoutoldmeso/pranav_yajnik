require 'rails_helper'

RSpec.describe 'gallery page' do
  let!(:photo) { create(:photo) }
  let!(:video) { create(:video) }
  let!(:pranav) { create(:pranav) }

  before do
    visit '/gallery'
  end

  it 'shows photos' do
    expect(page).to have_css('img.gallery_image')
  end

  it 'shows videos' do
    expect(page).to have_css('iframe.gallery_video')
  end
end
