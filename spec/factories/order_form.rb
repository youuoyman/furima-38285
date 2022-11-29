FactoryBot.define do
  factory :order_form do
    token         {'tok_abcdefghijk00000000000000000'}
    portal_code   {'123-4567'}
    prefecture_id {3}
    city          {'神戸市'}
    addresses     {'1-1-1'}
    building      {'建物ビル'}
    phone_number  {'09012345678'}
    user_id       { FactoryBot.create(:user).id }
    item_id       { FactoryBot.create(:item).id }
  end
end