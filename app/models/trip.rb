class Trip < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :users, through: :members, dependent: :destroy
  has_many :accommodations, dependent: :destroy
  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: 'User'

  # Declares that this class will have a photo attached to it
  has_one_attached :photo

  validates :name, :destination, presence: true
  validates :start_date, comparison: { greater_than: Date.today }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :budget_per_user, numericality: { greater_than: 0 }, allow_blank: true
end
