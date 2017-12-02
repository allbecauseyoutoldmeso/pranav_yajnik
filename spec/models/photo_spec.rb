require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:photo) { create(:photo, hidden: false) }

  describe 'international url' do

    it 'returns a modified version of the image url' do
      expect(photo.international_url).to eq photo.image.url
    end
  end

  describe 'shown' do
    
    it 'returns true if hidden is false' do
      expect(photo.shown).to eq true
    end

    it 'returns false if hidden is true' do
      photo.update_attributes(hidden: true)
      expect(photo.shown).to eq false
    end
  end
end
