def log_in(username, password)
  visit('/')
  fill_in('username', with: "#{username}")
  fill_in('password', with: "#{password}")
  click_button("Log in")
end