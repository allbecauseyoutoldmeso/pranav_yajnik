require 'rails_helper'

RSpec.describe 'contact page' do
  let!(:photo_placer) { create(:photo_placer, place: 'contact') }
  let!(:pranav) { create(:pranav) }

  context 'visitor' do

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

  context 'admin' do
    let!(:photo_placer_2) { create(:photo_placer, place: 'about pranav') }

    before do
      sign_in_admin
      visit '/contact'
    end

    it 'admin can edit contacts' do
      click_button 'edit pranav'
      fill_in 'email address', with: 'pranav@new_domain.com'
      click_button 'save'
      click_link 'contact'
      expect(page).to have_content 'pranav@new_domain.com'
    end
  end
end
