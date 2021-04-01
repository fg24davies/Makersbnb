def log_in(username:, password:)
  visit '/'
  click_link('Login')
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button('Log in')
end

def sign_up(name:, username:, email:, password:)
  visit '/'
  click_link('Sign Up')
  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Submit')
end
