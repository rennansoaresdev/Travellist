class Task < ApplicationRecord
  belongs_to :trip

  validates :description, presence: true

  def done?
    done
  end
end
