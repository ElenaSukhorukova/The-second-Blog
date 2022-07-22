require 'rails_helper'

describe Article do 
  
  describe 'validations' do 
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end

  describe 'associations' do
    it { should have_many :comments }
  end

  describe '#subject' do
    it 'returns the article title' do
      # create article's object tricky ways
      user = create(:user,  username: 'Helen',  email: 'helen@helen.com', password: 'hello123')
      article = create(:article, title: 'Hello', user_id: user.id)

      # assert, check
      expect(article.subject).to eq 'Hello'
    end
  end
end