class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :uname, presence: true
  validates :birthday, presence: true
  validates :sei, presence: true
  validates :mei, presence: true
  validates :sei_huri, presence: true
  validates :mei_huri, presence: true
end
