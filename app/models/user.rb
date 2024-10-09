class User < ApplicationRecord
  enum :role, [:normal_user, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= normal_user
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :itineraries, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_many :bookings, dependent: :destroy
  
  validates :name, presence: true
end
