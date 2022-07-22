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

  describe '#last_comment' do
    it 'returns the last comment' do
      #create user and article with comments from this user
      user = create(:user,  username: 'Helen',  email: 'helen@helen.com', password: 'hello123')
      article = create(:article_with_comments, user_id: user.id)

      #check

      expect(article.last_comment.body).to eq 'comment body 3'
    end
  end  

  describe '#title.length and #text.length' do
    it 'is not more 140 items and 4000 items' do
      user = create(:user,  username: 'Helen',  email: 'helen@helen.com', password: 'hello123')
      article = create(:article, title: 'Something', text: 'Something', user_id: user.id)
      
      expect(article.title_length).to be < 140
      expect(article.text_length).to be < 4000
    end
  end
end