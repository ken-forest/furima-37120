FactoryBot.define do
  factory :order_shipping_address do
    postal_code           {'123-4567'}
    prefecture_id         {30}
    city                  {'天理市杉本町'}
    address               {'123番地45'}
    building              {'高井ビル3階303'}
    phone_number          {0743667777}
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end