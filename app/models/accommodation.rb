class Accommodation < ApplicationRecord
  belongs_to :user
  belongs_to :trip
end
