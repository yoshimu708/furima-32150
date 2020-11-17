FactoryBot.define do
  factory :item do
    association :user

    name                  { 'オムライス' }
    price                 { 1000 }
    category_id           { 2 }
    status_id             { 2 }
    shipment_source_id    { 2 }
    estimated_arrival_id  { 2 }
    delivery_fee_id       { 2 }
    explanation           { 'これは素晴らしいオムライスです' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
