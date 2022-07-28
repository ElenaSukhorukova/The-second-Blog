require 'rails_helper'

feature 'Article Creation' do
  before(:each) do
    sign_up
  end

  scenario 'allows user to visit new article page' do
    visit new_article_path

    expect(page).to have_content I18n.t('articles.new_article')
  end

  scenario 'allows user to create new article' do
    
    new_article
    expect(page).to have_content 'Any title'
  end
end