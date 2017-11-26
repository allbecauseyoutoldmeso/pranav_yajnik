require 'rails_helper'

RSpec.describe Photo, type: :model do

  describe 'international url' do
    let(:photo) { create(:photo) }

    it 'returns a modified version of the image url' do
      expect(photo.international_url).to eq photo.image.url
    end
  end
end
