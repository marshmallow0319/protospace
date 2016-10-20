require 'faker'

FactoryGirl.define do
  factory :user do
    id Faker::Number.digit
    username Faker::Name.name
    email Faker::Internet.email
    password "00000000"
    password_confirmation "00000000"
    member Faker::Company.name
    profile Faker::Company.catch_phrase
    works Faker::Name.title
    avatar Faker::Avatar.image
  end
end
