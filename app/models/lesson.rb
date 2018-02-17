class Lesson < ActiveRecord::Base

  def self.sorted_by_time
    Lesson.all.sort_by { |lesson| lesson.start_time.seconds_since_midnight }.sort_by { |lesson| lesson.day }
  end

  def when
    Date::DAYNAMES[day] + ' ' + start_time.strftime('%H:%M')
  end

  def full_when
    Date::DAYNAMES[day] + ' ' + start_time.strftime('%H:%M') + ' - ' + end_time.strftime('%H:%M')
  end

  def run_time
    if start_date && end_date
      'From ' + start_date.strftime('%-d %b %Y') + ' until ' + end_date.strftime('%-d %b %Y') + '.'
    end
  end

  def has_freetext?
    freetext.present? && freetext != ''
  end
end
