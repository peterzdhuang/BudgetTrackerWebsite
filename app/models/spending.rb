class Spending < ApplicationRecord
  validates :name, :price, :kilograms, :quantity, :date_time_utc, presence: true
end
