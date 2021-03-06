FactoryBot.define do
  factory :user do
    uname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password = "aaa111"
    password {password}
    password_confirmation {password}
    birthday           {"1996-11-16"}
    sei                {"大田"}
    mei                {"義夫"}
    sei_huri           {"オオタ"}
    mei_huri           {"ヨシオ"}
  end
end