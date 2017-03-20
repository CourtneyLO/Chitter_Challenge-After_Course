  def sign_up
    visit('/user/new')
    fill_in("name", with: "Dan")
    fill_in("username", with: "Dan01")
    fill_in("email", with: "example@test.com")
    fill_in("password", with: "password")
    fill_in("password_confirmation", with: "password")
    click_button("Sign Up")
  end

  def fail_sign_up_password
    visit('/user/new')
    fill_in("name", with: "Dan")
    fill_in("username", with: "Dan01")
    fill_in("email", with: "example@test.com")
    fill_in("password", with: "password")
    fill_in("password_confirmation", with: "12345678")
    click_button("Sign Up")
  end

  def fail_sign_up_email
    visit('/user/new')
    fill_in("name", with: "Amanda")
    fill_in("username", with: "Amanda")
    fill_in("email", with: "example@test.com")
    fill_in("password", with: "password")
    fill_in("password_confirmation", with: "password")
    click_button("Sign Up")
  end

  def invalid_email
    visit('/user/new')
    fill_in("name", with: "Dan")
    fill_in("username", with: "Dan01")
    fill_in("email", with: "exampletestcom")
    fill_in("password", with: "password")
    fill_in("password_confirmation", with: "password")
    click_button("Sign Up")
  end

  def log_in
    fill_in("username", with: "Dan01")
    fill_in("password", with: "password")
    click_button("Log In")
  end
