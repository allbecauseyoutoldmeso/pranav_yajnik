require 'rails_helper'

RSpec.describe Pranav, type: :model do

  let(:pranav) { create(:pranav) }

  describe 'has_twitter_url?' do

    it 'returns true if twitter_url present' do
      expect(pranav.has_twitter_url?).to eq true
    end

    it 'returns false if twitter_url empty string' do
      pranav.twitter_url = ''
      expect(pranav.has_twitter_url?).to eq false
    end

    it 'returns false if twitter_url nil' do
      pranav.twitter_url = nil
      expect(pranav.has_twitter_url?).to eq false
    end
  end

  describe 'has_facebook_url?' do

    it 'returns true if facebook_url present' do
      expect(pranav.has_facebook_url?).to eq true
    end

    it 'returns false if facebook_url empty string' do
      pranav.facebook_url = ''
      expect(pranav.has_facebook_url?).to eq false
    end

    it 'returns false if facebook_url nil' do
      pranav.facebook_url = nil
      expect(pranav.has_facebook_url?).to eq false
    end
  end

  describe 'has_email_address?' do

    it 'returns true if email_address present' do
      expect(pranav.has_email_address?).to eq true
    end

    it 'returns false if email_address empty string' do
      pranav.email_address = ''
      expect(pranav.has_email_address?).to eq false
    end

    it 'returns false if email_address nil' do
      pranav.email_address = nil
      expect(pranav.has_email_address?).to eq false
    end
  end

  describe 'has_telephone_number?' do

    it 'returns true if telephone_number present' do
      expect(pranav.has_telephone_number?).to eq true
    end

    it 'returns false if telephone_number empty string' do
      pranav.telephone_number = ''
      expect(pranav.has_telephone_number?).to eq false
    end

    it 'returns false if telephone_number nil' do
      pranav.telephone_number = nil
      expect(pranav.has_telephone_number?).to eq false
    end
  end

  describe 'facebook_link' do
    it 'returns facebook link' do
      expect(pranav.facebook_link).to eq "https://www.facebook.com/#{pranav.facebook_url}"
    end
  end

  describe 'twitter_link' do
    it 'returns twitter link' do
      expect(pranav.twitter_link).to eq "https://www.twitter.com/#{pranav.twitter_url}"
    end
  end

  describe 'email_link' do
    it 'returns email link' do
      expect(pranav.email_link).to eq "mailto:#{pranav.email_address}?Subject=Kathak%20lessons"
    end
  end

  describe 'telephone_link' do
    it 'returns telephone link' do
      expect(pranav.telephone_link).to eq "tel:#{pranav.telephone_number}"
    end
  end
end
