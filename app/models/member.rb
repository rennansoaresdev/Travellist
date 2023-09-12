class Member < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :user, uniqueness: { scope: :trip }
end
