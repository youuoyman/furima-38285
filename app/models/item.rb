class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery

  #空の投稿を保存できない
  with_options: presence: true
    validates :image, :item_name, :item_info, :item_category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_id, :item_price
  end
  #金額のバリデーション
  with_options: presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                           presecse: { message: "can't be blank" }
  end
  #選択が---の時保存できない
  with_options: presecse: true
    validates :item_category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_id, numericality: { other_than: 1, message: "can't be blank"}
  end
end
