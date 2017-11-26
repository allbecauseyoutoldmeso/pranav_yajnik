require 'rails_helper'

RSpec.describe 'admin account' do
  let!(:home_photo_placer) { create(:photo_placer, place: 'home') }
  let!(:mobile_home_photo_placer) { create(:photo_placer, place: 'mobile home') }
  let!(:pranav) { create(:pranav) }
  let(:admin) { create(:admin, email: 'example@example.com', password: '12345678')}

  it 'admin can log in' do
    log_in_admin
    expect(page).to have_button 'log out admin'
  end

  it 'admin can log out' do
    log_in_admin
    click_button 'log out admin'
    expect(page).not_to have_button 'log out admin'
  end

  def log_in_admin
    visit new_admin_session_path
    fill_in 'email', with: admin.email
    fill_in 'password', with: admin.password
    click_button 'sign in'
  end
end
