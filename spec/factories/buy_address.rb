FactoryBot.define do
  factory :buy_address do
    


    postal {"123-1234"}
    prefectures_id {2}
    municipality  {"田中市"}
    adress {"青山1-1"}
    phone {"09012345678"}
    building           {"なんとかビル"}

    token {"tok_abcdefghijk00000000000000000"}


  end
end