# This will guess the User class
FactoryBot.define do
  factory :article do
    association :user
    title { 'Article title' }
    text { 'Article text' }
  end
end