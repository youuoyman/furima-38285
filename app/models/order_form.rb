class OrderForm
  include ActiveModel::Model 
  attr_accessor :portal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    #orderモデル
    validates :user_id
    validates :item_id
    #paymentモデル
    validates :portal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }, length: { is: 8 }
    validates :prefecture_id, numericality: { order_than: 0 }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/}, length: { maximum: 11}
    #トークン
    validates :token
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Payment.create(portal_code: portal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end