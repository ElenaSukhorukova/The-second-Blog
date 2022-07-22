require 'rails_helper'

describe Comment do

  describe 'validations' do
    it { should validate_presence_of :author }
    it { should validate_presence_of :body }
  end

  describe 'associations' do
    it { should belong_to :article }
  end

  describe '#length body' do
    it 'is not more 400 items' do
      user = create(:user,  username: 'Helen',  email: 'helen@helen.com', password: 'hello123')
      article = create(:article_with_comment, user_id: user.id)

      expect(article.comments.last.body_length).to be < 4000
    end
  end
end