require 'rails_helper'

feature 'Contact creation' do 
  scenario "allows access to contact page" do
    visit '/contacts'

    expect(page).to have_content I18n.t( "contacts.contact_us")
  end

  scenario "allows a guest to create contact" do
    visit '/contacts'
    
      fill_in :contact_name, with: 'user@example.com'
      fill_in :contact_email, with: 'user@example.com'
      fill_in :contact_message, with: 'Blabla'

      click_button 'Send message'
      expect(page).to have_content 'The message successfully send'
  end
end