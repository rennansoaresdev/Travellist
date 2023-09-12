class Trip < ApplicationRecord
  has_many :members
  has_many :tasks
  has_many :users, through: :groups
  has_many :accommodations
  has_many :tickets
  belongs_to :owner, class_name: 'User'

  # Declares that this class will have a photo attached to it
  has_one_attached :photo

  validates :name, :destination, presence: true
  validates :start_date, comparison: { greater_than: Date.today }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :budget_per_user, numericality: { greater_than: 0 }, allow_blank: true
end
