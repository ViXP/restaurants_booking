class Reservation < ApplicationRecord
  belongs_to :dining_table

  validates :reserver_name, presence: true, length: {in: 5..50}
  validates :reserve_start, :reserve_end, numericality:
    {greater_than_or_equal_to: 0.hours, less_than_or_equal_to: 36.hours}
  validate :correct_date, :enough_time, :in_schedule, :not_yet_reserved

  before_validation :check_date

  scope :actual, -> { where("reserve_date >= '#{Date.current}'") }

  def reserve_start
    (super || 0).seconds
  end

  def reserve_end
    (super || 0).seconds
  end

  private

  # Sets date if empty
  def check_date
    self.reserve_date ||= Date.current
  end

  # Validates if the date is still actual
  def correct_date
    if reserve_date < Date.current
      errors[:reserve_date] << I18n.t('activerecord.errors.messages.date_pass')
    end
  end

  # Validates if reserved time is more than 1 hour
  def enough_time
    if reserve_end < reserve_start + 1.hours
      errors[:base] << I18n.t('activerecord.errors.messages.reserv_time_error')
    end
  end

  # Validates that reservation is in range of schedule
  def in_schedule
    schedule = dining_table.restaurant.day_schedules.
      find_by(day_of_week: reserve_date.wday)
    if reserve_start < schedule.open_time || (reserve_end > schedule.close_time)
      errors[:base] << I18n.t('activerecord.errors.messages.out_of_schedule')
    end
  end

  # Validates that the time wasn't reserved yet
  def not_yet_reserved
    if find_intersection
      errors[:base] << I18n.t('activerecord.errors.messages.already_reserved')
    end
  end

  # Large SQL
  def find_intersection
    dining_table.reservations.find_by_sql(
      %(SELECT id FROM %{table} \
          WHERE reserve_date = '%{res_date}' \
            AND dining_table_id = %{dining_table_id} \
            AND (reserve_start < %{res_end}) AND (reserve_end > %{res_start})) %
      {
        table: self.class.table_name, dining_table_id: dining_table_id, 
        res_date: reserve_date, res_start: reserve_start, res_end: reserve_end
      }
    ).any?
  end
end
