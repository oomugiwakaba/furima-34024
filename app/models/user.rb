class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items


  with_options presence: true do
    validates :uname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "is invalid. Input full-width characters."} do
      validates :sei
      validates :mei
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
      validates :sei_huri
      validates :mei_huri
    end

    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: "is invalid. Input half-width characters."}

  end
end