class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :delivery
  belongs_to :prefectures
  belongs_to :status

  with_options presence: true do
    validates :image
    validates :iname
    validates :description
    validates :price
  
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    validates :price, numericality: {other_than: 0, message: "can't be blank"}
  end


  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :day_id
    validates :delivery_id 
    validates :prefectures_id
    validates :status_id
  end

end
