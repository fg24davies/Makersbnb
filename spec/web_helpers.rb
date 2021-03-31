def log_in(username, password)
  visit('/')
  fill_in('username', with: "#{username}")
  fill_in('password', with: "#{password}")
  click_button("Log in")
end

def sign_up(username, email)
  visit '/'
  click_button("Sign-up")
  fill_in('name', with: 'Alec')
  fill_in('username', with: username)
  fill_in('email', with: email)
  fill_in('password', with: 'goorangutans')
  click_button('Submit')
end
