class Accommodation < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  has_one_attached :photo

  validates :price, presence: true
  validates :checkin_time, presence: true, comparison: { greater_than: Date.today }
  validates :name, presence: true, uniqueness: { scope: :trip }
  validates :checkout_time, presence: true, comparison: { greater_than: :checkin_time }
  validates :capacity, numericality: { only_integers: true }
  validates :url, presence: true,
                  uniqueness: { scope: :trip },
                  format: { with: %r{\A(https?://)?(w{3}\.)?[A-Za-z0-9\-]*\.[A-Za-z]{2,5}(.br)?(/[A-Za-z0-9$\-_\.+!\*\s'\(\)\?\=\&\;\%\#]*)*\z} }
end
