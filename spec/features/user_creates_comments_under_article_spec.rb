require 'rails_helper'

feature 'Comment Creation' do
  before(:each) do
    sign_up
    new_article
  end

  scenario 'allows user to leave a comment under an article' do

    fill_in :comment_body, with: 'Comment body'
    click_button 'Send comment'

    expect(page).to have_content 'Comment body'
  end
end  