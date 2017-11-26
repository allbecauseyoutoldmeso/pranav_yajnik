require 'rails_helper'

RSpec.describe 'gallery page' do
  let!(:pranav) { create(:pranav) }

  context 'visitor' do

    let!(:photo) { create(:photo) }
    let!(:video) { create(:video) }

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

  context 'admin' do

    before do
      sign_in_admin
    end

    context 'video' do
      let!(:video) { create(:video) }

      before do
        visit '/gallery'
      end

      it 'admin can delete video' do
        click_button 'delete'
        expect(page).not_to have_css('iframe.gallery_video')
      end

      it 'admin can add video' do
        click_button 'add video'
        fill_in 'caption', with: 'pranav dancing'
        fill_in 'you tube id', with: 'ADCDEF'
        expect{ click_button 'save' }.to change{ Video.count }.by(1)
      end
    end

    context 'photo' do
      let!(:photo) { create(:photo) }
      let!(:photo_2) { create(:photo) }
      let!(:home_photo_placer) { create(:photo_placer, place: 'home', photo: photo, url: '/') }
      let!(:mobile_home_photo_placer) { create(:photo_placer, place: 'mobile home', photo: photo, url: '/') }
      let!(:about_pranav_photo_placer) { create(:photo_placer, place: 'about pranav', photo: photo, url: '/about_pranav') }
      let!(:contact_photo_placer) { create(:photo_placer, place: 'contact', photo: photo, url: '/contact') }
      let!(:lessons_photo_placer) { create(:photo_placer, place: 'lessons', photo: photo, url: '/lessons') }

      before do
        visit '/gallery'
      end

      it 'admin can delete photo' do
        expect{ first(:button, 'delete').click }.to change{ Photo.count }.by(-1)
      end

      it 'admin can set home photo' do
        first(:button, 'home').click
        expect(home_photo_placer.reload.photo).to eq photo_2
      end

      it 'setting home photo redirects user to home page' do
        first(:button, 'home').click
        expect(page).to have_css('img#home_image')
      end

      it 'admin can set mobile home photo' do
        first(:button, 'mobile home').click
        expect(mobile_home_photo_placer.reload.photo).to eq photo_2
      end

      it 'setting mobile home photo redirects user to home page' do
        first(:button, 'mobile home').click
        expect(page).to have_css('img#home_image')
      end

      it 'admin can set "about pranav" photo' do
        first(:button, 'about pranav').click
        expect(about_pranav_photo_placer.reload.photo).to eq photo_2
      end

      it 'setting "about pranav" photo redirects user to "about pranav" page' do
        first(:button, 'about pranav').click
        expect(page).to have_content(pranav.about)
      end

      it 'admin can set lessons photo' do
        first(:button, 'lessons').click
        expect(lessons_photo_placer.reload.photo).to eq photo_2
      end

      it 'setting lessons photo redirects user to lessons page' do
        first(:button, 'lessons').click
        expect(page).to have_css('img#lessons_image')
      end

      it 'admin can set contact photo' do
        first(:button, 'contact').click
        expect(contact_photo_placer.reload.photo).to eq photo_2
      end

      it 'setting contact photo redirects user to contact page' do
        first(:button, 'contact').click
        expect(page).to have_content(pranav.email_address)
      end

      it 'admin can add photo' do
        allow_any_instance_of(Paperclip::HasAttachedFile).to receive(:define_setter)
        click_button 'add photo'
        fill_in 'caption', with: 'pranav dancing'
        expect { click_button 'upload' }.to change{ Photo.count }.by(1)
      end
    end
  end
end
