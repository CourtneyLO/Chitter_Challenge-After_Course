  def sign_up
    visit('/user/new')
    fill_in("name", with: "Dan")
    fill_in("username", with: "Dan01")
    fill_in("email", with: "Dan@test.com")
    fill_in("password", with: "password")
    fill_in("password_confirmation", with: "password")
    click_button("Sign Up")
  end
