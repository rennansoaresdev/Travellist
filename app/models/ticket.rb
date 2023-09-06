class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :start_time, :origin, :destination, :company_name, presence: true
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :url, presence: true,
                  uniqueness: { scope: :trip },
                  format: { with: %r{\A(https?://)?
                                  (w{3}\.)?
                                  [A-Za-z0-9\-]*
                                  \.[A-Za-z]{2,5}
                                  (.br)?
                                  (/[A-Za-z0-9$\-_\.+!\*\s'\(\)\?\=\&\;\%\#]*)*\z} }
end
