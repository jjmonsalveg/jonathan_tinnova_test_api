class BeerUser < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates_presence_of :date, :time

  after_initialize :set_date_and_time

  private

  def set_date_and_time
    self.date = Date.current
    self.time = Time.current
  end
end
