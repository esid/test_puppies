require_relative "side_menu_panel"

class LoginPage
  include PageObject
  include DataMagic
  include SideMenuPanel


  page_url "#{FigNewton.base_url}/admin"


  text_field(:username, :id => 'name')
  text_field(:password, :id => 'password')
  button(:login, :value => 'Login')


  def login_to_system( creds = {})
    self.username = FigNewton.admin_username
    self.password = FigNewton.admin_password
    login
  end
end