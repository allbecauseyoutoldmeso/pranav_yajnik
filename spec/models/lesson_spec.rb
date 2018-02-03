require 'rails_helper'

RSpec.describe Lesson, type: :model do

  describe 'sorted by time' do
    let!(:lesson_1) { create(:lesson, day: 1, start_time: '19:00'.to_time) }
    let!(:lesson_2) { create(:lesson, day: 1, start_time: '18:00'.to_time) }
    let!(:lesson_3) { create(:lesson, day: 2, start_time: '18:00'.to_time) }

    it 'returns existing lessons ordered by day and time' do
      expect(Lesson.sorted_by_time).to eq [lesson_2, lesson_1, lesson_3]
    end
  end

  describe 'when' do
    let(:lesson) { create(:lesson, day: 1, start_time: '19:00'.to_time) }

    it 'returns a formatted string' do
      expect(lesson.when).to eq 'Monday 19:00'
    end
  end

  describe 'has_freetext?' do
    let(:lesson_with_freetext) { create(:lesson) }
    let(:lesson_with_invalid_freetext) { create(:lesson, freetext: '') }
    let(:lesson_without_freetext) { create(:lesson, freetext: nil) }

    it 'returns true if lesson has freetext' do
      expect(lesson_with_freetext.has_freetext?).to eq true
    end

    it 'returns false if lesson freetext is empty string' do
      expect(lesson_with_invalid_freetext.has_freetext?).to eq false
    end

    it 'returns false if lesson has no freetext' do
      expect(lesson_without_freetext.has_freetext?).to eq false
    end
  end
end
