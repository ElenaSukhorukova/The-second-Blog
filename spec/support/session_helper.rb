def sign_up
  visit new_user_registration_path

  fill_in :user_email, with: 'user@user.com' 
  fill_in :user_username, with: 'user'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'

  click_button 'Sign up' 
end