require 'rails_helper'

RSpec.describe PranavsController, type: :controller do

  let(:admin) { create(:admin) }
  let(:pranav) { create(:pranav) }

  before do
    sign_in admin
  end

  describe 'update' do
    let(:params) do
      {
        id: pranav.id,
        pranav:
        {
          email_address: 'pranav@new_domain.com'
        }
      }
    end

    it 'updates pranav\'s details' do
      post :update, params: params
      expect(pranav.reload.email_address).to eq 'pranav@new_domain.com'
    end

    it 'redirects to about pranav' do
      post :update, params: params
      expect(response).to redirect_to '/about_pranav'
    end
  end
end
