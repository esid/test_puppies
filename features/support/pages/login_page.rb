require_relative "side_menu_panel"

class LoginPage
  include PageObject
  include DataMagic
  include SideMenuPanel


  page_url "http://puppies.herokuapp.com/login"

  text_field(:username, :id => 'name')
  text_field(:password, :id => 'password')
  button(:login, :value => 'Login')


  def login_to_system( creds = {})
    populate_page_with data_for(:admin_user, creds)
    login
  end
=begin
    self.username = username
    self.password = password
=end
end