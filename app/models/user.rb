class User < ApplicationRecord
  GENDERS = %w[Masculino
               Feminino
               Não-binário
               Prefiro\ não\ dizer]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :trips, through: :groups
  has_many :accommodations
  has_many :tickets

  validates :last_name, :city, :country, presence: true
  validates :first_name, presence: true, length: { minimum: 3 }
  validates :birth_date, presence: true, comparison: { less_than: 18.years.ago }
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[A-Za-z0-9\._-]*@[A-Za-z0-9]*\.[A-Za-z]{3,5}\z/ }
end
