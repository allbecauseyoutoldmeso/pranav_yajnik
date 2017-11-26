require 'rails_helper'

RSpec.describe 'lessons page' do
  let!(:photo_placer) { create(:photo_placer, place: 'lessons') }
  let!(:lesson) { create(:lesson) }
  let!(:pranav) { create(:pranav) }

  before do
    visit '/lessons'
  end

  it 'shows what' do
    expect(page).to have_content lesson.what
  end

  it 'shows where' do
    expect(page).to have_content lesson.where
  end

  it 'shows where' do
    expect(page).to have_content lesson.when
  end

  it 'shows lessons image' do
    expect(page).to have_css('img#lessons_image')
  end
end
