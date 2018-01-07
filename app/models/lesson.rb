class Lesson < ActiveRecord::Base

  def self.sorted_by_time
    Lesson.all.sort_by { |lesson| lesson.time.seconds_since_midnight }.sort_by { |lesson| lesson.day }
  end

  def when
    Date::DAYNAMES[day] + ' ' + time.strftime('%H:%M')
  end

  def has_freetext?
    freetext.present? && freetext != ''
  end
end
