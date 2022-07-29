require 'rails_helper'

feature 'Article Updating' do 
  given!(:user) { User.create(email: 'user@user.com', username: 'user', password: 'password', password_confirmation: 'password') }
  given!(:article) { Article.create(id: 1, title: 'Any title', text: 'Any text', user_id: user.id) }
  
  before(:each) do

    visit new_user_session_path

    within("#new_user") do
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
    end

    click_button 'Log in' 

    visit new_article_path

    fill_in :article_title, with: article.title
    fill_in :article_text, with: article.text
    
    click_button 'Send article'
  end

  scenario 'allows user to udate an article' do
    visit edit_article_path(article)
  
      fill_in :article_title, with: article.update(title: 'Another title')
      fill_in :article_text, with: article.update(text: 'Another text')    

      click_button 'Edit'

    expect(page).to have_content 'Article update successfully'
    expect(article.title).to have_content 'Another title'

  end
end