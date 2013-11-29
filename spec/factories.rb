FactoryGirl.define do
  factory :user do
    first_name     "Oli"
    last_name "Bates"
    email    "olibates@live.com"
    password "password"
    password_confirmation "password"
    phone_no "07891919907"
  end
end