require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  let(:admin) { create(:admin) }

  before do
    sign_in admin
  end

  describe 'create' do
    let(:params) do
      {
        video:
        {
          caption: 'pranav dancing',
          you_tube_id: 'ABCDEFG'
        }
      }
    end

    it 'creates a video' do
      expect { post :create, params: params }.to change { Video.count }.from(0).to(1)
    end

    it 'redirects to gallery' do
      post :create, params: params
      expect(response).to redirect_to '/gallery'
    end
  end

  describe 'destroy' do
    let!(:video) { create(:video) }
    let(:params) do
       { id: video.id }
    end

    it 'destroys the video' do
      expect { post :destroy, params: params }.to change { Video.count }.from(1).to(0)
    end

    it 'redirects to gallery' do
      post :destroy, params: params
      expect(response).to redirect_to '/gallery'
    end
  end
end
