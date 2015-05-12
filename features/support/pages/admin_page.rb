require_relative 'side_menu_panel'

class AdminPage
  include PageObject
  include Buttons
  include DataMagic
  include SideMenuPanel

  def process_adoption_for(adopter)
    button_element(:value => PROCESS_PUPPY, :index => 0 ).click
  end


end
