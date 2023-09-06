class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :start_time, :origin, :destination, :company_name, presence: true
  validates :end_time, comparison: { greater_than: :start_time }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :url, presence: true,
                  uniqueness: { scope: :trip },
                  format: { with: %r{\A(https?://)?(w{3}\.)?[A-Za-z0-9\-]*\.[A-Za-z]{2,5}(.br)?(/[A-Za-z0-9$\-_\.+!\*\s'\(\)\?\=\&\;\%\#]*)*\z} }

  def duration
    time_diff = end_time.to_time - start_time.to_time
    hours = (time_diff / 1.hour).to_i
    minutes = (((time_diff / 1.hour) - hours) * 60).to_i
    return { hours:, minutes: }
  end
end
