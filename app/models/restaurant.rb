class Restaurant < ApplicationRecord
  has_many :day_schedules
  has_many :dining_tables

  after_create :create_schedule

  validates :title, length: {in: 2..60}, uniqueness: true
  validates :description, length: {maximum: 300}

  private

  # Creates the day schedule 'template'
  def create_schedule
    days = ''
    time = Time.zone.now
    (0..6).each {|day| days << "(#{id}, #{day}, '#{time}', '#{time}'), "}
    ActiveRecord::Base.connection.execute(
      "INSERT INTO #{day_schedules.table_name} \
      (restaurant_id, day_of_week, created_at, updated_at) \
      VALUES #{days.chomp(', ')};"
    )
  end
end
