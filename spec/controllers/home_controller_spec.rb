require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  let!(:pranav) { create(:pranav) }

  describe 'index' do
    let!(:home_photo) { create(:photo) }
    let!(:mobile_home_photo) { create(:photo) }
    let!(:home_photo_placer) { create(:photo_placer, place: 'home', photo: home_photo) }
    let!(:mobile_home_photo_placer) { create(:photo_placer, place: 'mobile home', photo: mobile_home_photo) }

    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns pranav' do
      expect(assigns(:pranav)).to eq pranav
    end

    it 'assigns home image url' do
      expect(assigns(:photo_url)).to eq home_photo.international_url
    end

    it 'assigns mobile home image url' do
      expect(assigns(:mobile_photo_url)).to eq mobile_home_photo.international_url
    end
  end

  describe 'about pranav' do
    let!(:photo) { create(:photo) }
    let!(:photo_placer) { create(:photo_placer, place: 'about pranav', photo: photo) }

    before do
      get :about_pranav
    end

    it 'assigns about pranav' do
      expect(assigns(:about_pranav)).to eq pranav.about

    end

    it 'assigns about pranav image url' do
      expect(assigns(:photo_url)).to eq photo.international_url
    end
  end

  describe 'gallery' do

    context 'items' do
      let!(:photo_1) { create(:photo, created_at: 3.days.ago) }
      let!(:photo_2) { create(:photo, created_at: 1.days.ago) }
      let!(:video_1) { create(:video, created_at: 2.days.ago) }
      let!(:video_2) { create(:video, created_at: 4.days.ago) }

      it 'assigns gallery_items ordered by created_at' do
        get :gallery
        expect(assigns(:gallery_items)).to eq [photo_2, video_1, photo_1, video_2]
      end
    end

    context 'photo_placers' do
      let!(:photo_placer_1) { create(:photo_placer, place: 'home') }
      let!(:photo_placer_2) { create(:photo_placer, place: 'about pranav') }
      let!(:photo_placer_3) { create(:photo_placer, place: 'contact') }

      it 'assigns photo_placers ordered by name' do
        get :gallery
        expect(assigns(:photo_placers)).to eq [photo_placer_2, photo_placer_3, photo_placer_1]
      end
    end
  end
end
