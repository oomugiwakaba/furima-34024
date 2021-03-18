class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:postal,:prefectures_id,:municipality,:adress,:phone,:building,:token

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :phone, length: {only_integer: true, maximum: 11}
    validates :adress
    validates :item_id
    validates :user_id
    validates :token

  end

  validates :phone, numericality: true

  validates :prefectures_id, numericality: { other_than: 1 }



  def save!
    buy = Buy.create!(item_id: item_id, user_id: user_id)
    Address.create!(buy_id: buy.id, postal: postal, prefectures_id: prefectures_id, municipality: municipality, adress: adress, phone: phone, building: building)
  end
end