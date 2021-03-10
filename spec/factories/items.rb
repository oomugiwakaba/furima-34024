FactoryBot.define do
  factory :item do
    association :user


    iname {"プリン"}
    description {"すごいよ！"}
    category_id  {2}
    status_id {2}
    delivery_id {2}
    prefectures_id           {2}
    day_id                {2}
    price                {5000}



    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
