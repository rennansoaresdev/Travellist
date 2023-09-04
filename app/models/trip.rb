class Trip < ApplicationRecord
  has_many :groups
  has_many :users, through: :groups
  has_many :accommodations
  has_many :tickets
  belongs_to :owner, class_name: 'User'
end
