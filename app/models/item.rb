class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  #空の投稿を保存できない
  validates :image, :item_name, :item_info, :item_category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_id, :item_price, presence: true
  #ジャンルの選択---保存できない
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank"}

end
