FactoryBot.define do
  factory :item do
    item_name                {'明るい内装'}
    detail                   {'落ち着く'}
    item_category_id         {5}
    item_sale_status_id      {2}
    fee_status_id            {3}
    prefecture_id            {2}
    scheduled_delivery_id    {3}
    price                    {'100000'}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end


  end
end
