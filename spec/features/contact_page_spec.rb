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
      click_button 'edit pranav'
    end

    it 'admin can edit email address' do
      fill_in 'email address', with: 'pranav@new_domain.com'
      click_button 'save'
      click_link 'contact'
      expect(page).to have_content 'pranav@new_domain.com'
    end

    it 'admin can edit telephone number' do
      fill_in 'phone number', with: '12345123123'
      click_button 'save'
      click_link 'contact'
      expect(page).to have_content '12345123123'
    end

    it 'admin can edit twitter handle' do
      fill_in 'twitter handle', with: 'pranav_new'
      click_button 'save'
      click_link 'contact'
      expect(page).to have_content 'pranav_new'
    end

    it 'admin can edit faceboook handle' do
      fill_in 'facebook handle', with: 'pranav_new'
      click_button 'save'
      click_link 'contact'
      expect(page).to have_content 'pranav_new'
    end
  end
end
