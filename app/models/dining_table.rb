class DiningTable < ApplicationRecord
  belongs_to :restaurant
  has_many :reservations

  validates :number, numericality: {greater_than: 0}, presence: true
  validates :quantity_of_persons, numericality: {in: 1..100}, presence: true
end
