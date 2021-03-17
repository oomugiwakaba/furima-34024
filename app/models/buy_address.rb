class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:buy_id,:postal,:prefectures_id,:municipality,:adress,:phone,:building,:token

  # ここにバリデーションの処理を書く
  with_options presence: true do

    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id
    validates :municipality
    validates :phone, length: {only_integer: true, maximum: 11}
    validates :adress
    validates :item_id
    validates :user_id

    validates :token, presence: true

  end




  def save!
    # 各テーブルにデータを保存する処理を書く
    buy = Buy.create!(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create!(buy_id: buy.id, postal: postal, prefectures_id: prefectures_id, municipality: municipality, adress: adress, phone: phone, building: building)
  end
end