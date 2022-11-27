class OrderForm
  include ActiveModel::Model #トークンが必要になるかも
  attr_accessor :portal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id
    
  #バリデーション
  validates :prefecture_id, :city, :addresses, presence: true

  with_options presence: true do
    validates :portal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "良い例:123-4567 良くない例:1234567"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "良い例:09012345678 良くない例:090-1234-5678"}
    validates :prefecture_id, numericality: { order_than: 0, message: "選択してください"}
  end

  def save
    @orders = Order.create(user_id: user_id, item_id: item_id)
    Payment.create(portal_code: portal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)

  end
end