require 'rails_helper'

RSpec.describe 'lessons page' do
  let!(:lessons_photo_placer) { create(:photo_placer, place: 'lessons') }
  let!(:contact_photo_placer) { create(:photo_placer, place: 'contact') }
  let!(:lesson) { create(:lesson) }
  let!(:pranav) { create(:pranav) }

  context 'visitor' do

    before do
      visit '/lessons'
    end

    it 'shows what' do
      expect(page).to have_content lesson.what
    end

    it 'shows where' do
      expect(page).to have_content lesson.where
    end

    it 'shows where' do
      expect(page).to have_content lesson.when
    end

    it 'shows free text' do
      expect(page).to have_content lesson.freetext
    end

    it 'has link to contacts page' do
      click_link 'Contact Pranav'
      expect(page).to have_content pranav.email_address
    end

    it 'shows lessons image' do
      expect(page).to have_css('img#lessons_image')
    end
  end

  context 'admin' do

    before do
      sign_in_admin
      visit '/lessons'
    end

    it 'admin can delete lesson' do
      click_button 'delete'
      expect(page).not_to have_content lesson.what
    end

    it 'admin can edit lesson' do
      click_button 'edit'
      select('Wednesday', from: 'day')
      click_button 'save'
      expect(page).to have_content 'Wednesday'
    end

    it 'admin can add lesson' do
      click_button 'add lesson'
      fill_in 'what', with: 'Intermediate'
      fill_in 'where', with: '123 Pranav Street, London, AB1 2CD'
      select('Monday', from: 'day')
      select('18', from: 'lesson_time_4i')
      select('00', from: 'lesson_time_5i')
      click_button 'save'
      expect(page).to have_content 'Intermediate'
    end
  end
end
