require 'rails_helper'

RSpec.describe Lesson, type: :model do

  describe 'sorted by time' do
    let!(:lesson_1) { create(:lesson, day: 1, time: '19:00'.to_time) }
    let!(:lesson_2) { create(:lesson, day: 1, time: '18:00'.to_time) }
    let!(:lesson_3) { create(:lesson, day: 2, time: '18:00'.to_time) }

    it 'returns existing lessons ordered by day and time' do
      expect(Lesson.sorted_by_time).to eq [lesson_2, lesson_1, lesson_3]
    end
  end
end
