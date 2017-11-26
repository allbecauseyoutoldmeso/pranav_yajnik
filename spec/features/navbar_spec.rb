require 'rails_helper'

RSpec.describe 'navbar' do
  let!(:home_photo_placer) { create(:photo_placer, place: 'home') }
  let!(:mobile_home_photo_placer) { create(:photo_placer, place: 'mobile home') }
  let!(:about_pranav_photo_placer) { create(:photo_placer, place: 'about pranav') }
  let!(:about_pranav_photo_placer) { create(:photo_placer, place: 'about pranav') }
  let!(:contact_photo_placer) { create(:photo_placer, place: 'contact') }
  let!(:lessons_photo_placer) { create(:photo_placer, place: 'lessons') }
  let!(:lesson) { create(:lesson, what: 'Beginners')}
  let!(:pranav) { create(:pranav) }

  context 'on home page' do

    before do
      visit '/'
    end

    it '"about pranav" link leads to "about pranav" page' do
      click_link 'about pranav'
      expect(page).to have_css('div#about_pranav_text')
    end

    it '"gallery" link leads to gallery page' do
      click_link 'gallery'
      expect(page).to have_css('img.gallery_image')
    end

    it '"lessons" link leads to lessons page' do
      click_link 'lessons'
      expect(page).to have_content(lesson.what)
    end

    it '"contact" link leads to contact page' do
      click_link 'contact'
      expect(page).to have_content(pranav.email_address)
    end
  end

  context 'not on home page' do

    before do
      visit '/gallery'
    end

    it '"home" link leads to home page' do
      click_link 'home'
      expect(page).to have_css('img#home_image')
    end

    it '"pranav yajnik" link leads to home page' do
      click_link 'pranav yajnik'
      expect(page).to have_css('img#home_image')
    end
  end
end
