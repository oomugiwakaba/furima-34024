class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :delivery
  belongs_to :prefectures
  belongs_to :status

  validates :image, presence: true
  validates :iname,  presence: true
  validates :description,  presence: true
  validates :price, presence: true

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :price, presence: true, numericality: {other_than: 0, message: "can't be blank"}


  validates :category_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
  validates :delivery_id, numericality: { other_than: 1 } 
  validates :prefectures_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 


end
