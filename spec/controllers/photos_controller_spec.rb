require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  let(:admin) { create(:admin) }

  before do
    sign_in admin
  end

  describe 'destroy' do

    context 'multiple photos' do
      let!(:photo_1) { create(:photo) }
      let!(:photo_2) { create(:photo) }
      let!(:photo_placer) { create(:photo_placer, photo: photo_1) }
      let(:params) do
        { id: photo_1.id }
      end

      it 'destroys the photo' do
        expect{ post :destroy, params: params }.to change { Photo.count }.from(2).to(1)
      end

      it 'redirects to the gallery' do
        post :destroy, params: params
        expect(response).to redirect_to '/gallery'
      end

      it 'assigns any child photo_placers to another photo' do
        post :destroy, params: params
        expect(photo_placer.reload.photo).to eq photo_2
      end
    end

    context 'only one photo' do
      let!(:photo) { create(:photo) }
      let(:params) do
        { id: photo.id }
      end

      it 'does not destroy the photo' do
        expect { post :destroy, params: params }.not_to change { Photo.count }.from(1)
      end

      it 'redirects to the gallery' do
        post :destroy, params: params
        expect(response).to redirect_to '/gallery'
      end
    end
  end

  describe 'create' do
    let(:image) { fixture_file_upload("#{Rails.root}/spec/support/test_image.jpg", 'image/jpeg') }
    let(:params) do
      {
        photo:
        {
          caption: 'pranav',
          image: image
        }
      }
    end

    it 'creates a photo' do
      expect { post :create, params: params }.to change { Photo.count }.from(0).to(1)
    end
  end

  describe 'update' do
    let(:photo) { create(:photo, hidden: false) }
    let(:params) do
      {
        id: photo.id,
        photo:
        {
          hidden: true
        }
      }
    end

    it 'updates the photo' do
      expect { post :update, params: params }.to change { photo.reload.hidden }.from(false).to(true)
    end
  end
end
