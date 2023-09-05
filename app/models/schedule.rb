class Schedule < ApplicationRecord
  belongs_to :trip

  validates :title, :start_time, presence: true
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
end
