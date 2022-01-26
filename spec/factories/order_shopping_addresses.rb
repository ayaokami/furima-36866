FactoryBot.define do
  factory :order_shopping_address do
    postcode { '501-0203' }
    prefecture_id { 22 }
    city     { '瑞穂市' }
    block    { '馬場上光町3-90-1' }
    phone_number { '08008080808' }
  end
end
