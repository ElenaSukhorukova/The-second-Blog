# This will guess the User class
FactoryBot.define do
  factory :article do
    association :user
    title { 'Article title' }
    text { 'Article text' }

    # create factory with name article_with_comments
    # for creating article with a few comments
    factory :article_with_comments do
      #after creating article
      after :create do |article, evaluator|
        # create list with three comments
        create_list :comment, 3, article: article
      end
    end

    factory :article_with_comment do
      #after creating article
      after :create do |article, evaluator|
        # create list with three comments
        create_list :comment, 1, article: article
      end
    end
  end
end