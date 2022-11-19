class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :item_price
    validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "Price is not included in the list" }
    validates :item_price, format: { with: /\A[0-9]+\z/, message: "Price is not included in the list" }
    validates :item_category_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :delivery_id, numericality: { other_than: 1, message: "can't be blank"}
  end
end
