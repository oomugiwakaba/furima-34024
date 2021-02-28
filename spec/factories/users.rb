FactoryBot.define do
  factory :user do
    uname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    # password  { '1a' + Faker::Internet.password(min_length: 6) }
    # password = "aaa111"
    password { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }
    password {password}
    password_confirmation {password}
    birthday           {"1996-11-16"}
    sei                {"大田"}
    mei                {"義夫"}
    sei_huri           {"オオタ"}
    mei_huri           {"ヨシオ"}
  end
end