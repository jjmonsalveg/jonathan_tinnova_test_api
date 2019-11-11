class BeerUser < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates_presence_of :date, :time

  def seen_at
    DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec)
  end
end
