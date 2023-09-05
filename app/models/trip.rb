class Trip < ApplicationRecord
  has_many :groups
  has_many :users, through: :groups
  has_many :accommodations
  has_many :tickets
  belongs_to :owner, class_name: 'User'

  validates :name, :start_date, :destination, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :budget_per_user, numericality: { greater_than: 0 }
end
