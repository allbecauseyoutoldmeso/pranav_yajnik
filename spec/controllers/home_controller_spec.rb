require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  let!(:pranav) { create(:pranav) }
  let!(:photo) { create(:photo) }
  let!(:photo_placer_1) { create(:photo_placer, place: 'home', photo: photo) }
  let!(:photo_placer_2) { create(:photo_placer, place: 'mobile home', photo: photo) }

  describe 'index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
