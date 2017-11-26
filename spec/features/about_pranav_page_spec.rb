require 'rails_helper'

RSpec.describe 'about pranav page' do
  let!(:photo_placer) { create(:photo_placer, place: 'about pranav') }
  let!(:pranav) { create(:pranav) }

  context 'visitor' do

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

  context 'admin' do

    before do
      sign_in_admin
      visit '/about_pranav'
    end

    it 'admin can edit "about pranav"' do
      click_button 'edit pranav'
      fill_in 'about pranav', with: 'Pranav is a very experienced teacher.'
      click_button 'save'
      expect(page).to have_content 'Pranav is a very experienced teacher.'
    end
  end
end
