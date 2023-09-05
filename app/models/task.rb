class Task < ApplicationRecord
  belongs_to :trip

  validates :description, :done, presence: true
end
