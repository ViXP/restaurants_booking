class DaySchedule < ApplicationRecord
  belongs_to :restaurant

  attr_readonly :day_of_week

  validates :day_of_week, numericality: {in: 0..6}
  validates :open_time, :close_time, numericality:
    {greater_than_or_equal_to: 0.hours, less_than_or_equal_to: 36.hours}
  validate :correct_time, :not_intersects

  def open_time
    (super || 0).seconds
  end

  def close_time
    (super || 0).seconds
  end

  def day_of_week_word
    Date::DAYNAMES[day_of_week]
  end

  private

  # Validates that close time is later than opening
  def correct_time
    if open_time > close_time
      errors[:base] << I18n.t('activerecord.errors.messages.incorrect_time')
    end
  end

  # Validates that schedule not intersects with previous day schedule
  def not_intersects
    if (open_time < 12.hours || close_time < 12.hours) &&
      (prev = restaurant.day_schedules.find_by(day_of_week: day_of_week - 1))
      find_time = open_time < 12.hours ? open_time : close_time
      find_time += 86401.seconds # 24 hours + 1 second
      if (prev.open_time..prev.close_time).include?(find_time)
        errors[:base] << I18n.t('activerecord.errors.messages.' \
          'schedules_intersect')
      end
    end
  end
end
