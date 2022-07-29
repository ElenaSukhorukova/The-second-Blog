require 'rails_helper'

feature 'Article Updating' do 
  before(:each) do 
    @user = User.new email: 'user@user.com', username: 'user', password: 'password', password_confirmation: 'password'
    @article = Article.new id: 1, title: 'Any title', text: 'Any text', user_id: @user.id
  end

  scenario 'allows user to udate an article' do
    visit edit_article_path(@article.id)

    fill_in :article_title, with: 'Another title'
    fill_in :article_text, with: 'Another text'

    click_button 'Edit'

    expect(page).to have_content 'Article update successfully'
  end
end