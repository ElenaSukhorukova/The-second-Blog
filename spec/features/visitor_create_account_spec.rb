require 'rails_helper'

feature 'Account creation' do 
  before(:each) do 
    sign_up
  end
  
  scenario "allows guest to create account" do
    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end

  scenario 'allows to greet user with using name' do
    expect(page).to have_content I18n.t('users.greeting_user', username: 'User')
  end
end

