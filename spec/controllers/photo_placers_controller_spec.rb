require 'rails_helper'

RSpec.describe PhotoPlacersController, type: :controller do

  let(:admin) { create(:admin) }

  before do
    sign_in admin
  end

  describe 'update' do
    let(:photo_placer) { create(:photo_placer) }
    let(:photo) { create(:photo) }
    let(:params) do
      {
        id: photo_placer.id,
        photo_id: photo.id,
        format: 'js'
      }
    end

    it 'updates the photo_placer photo' do
      post :update, params: params
      expect(photo_placer.reload.photo).to eq photo
    end
  end
end
