require_relative 'side_menu_panel'

class HomePage
  include PageObject
  include Buttons
  include SideMenuPanel

  page_url "http://puppies.herokuapp.com"

  PUPPY_LOOKUP = {
      "Brook" => 0,
      "Hanna" => 1,
      "Maggie Mae" => 2
  }


 def select_puppy_number(name = 'Brook')
   index = puppy_index_for(name)
   button_element(:value => VIEW_DETAILS, :index => index ).click
 end

  def select_puppy(name = 'Brook')
     index = puppy_index_for(name)
     button_element(:value => VIEW_DETAILS, :index => index).click
  end

  private

  def puppy_index_for(name)
    PUPPY_LOOKUP[name]
  end
end