class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :payment, optional: true
end
