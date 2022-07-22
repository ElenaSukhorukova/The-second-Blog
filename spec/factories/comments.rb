FactoryBot.define do
  factory :comment do
    association :article
    author { 'Somebody' }
    sequence :body do |n| 
      "comment body #{n}"
    end
  end
end