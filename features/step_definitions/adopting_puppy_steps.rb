include Buttons

Given(/^am on the puppy adoption site$/) do
  visit_page(HomePage)
end

When(/^click the View Details button for ([^"]*)$/) do |dog_name|
  on_page(HomePage).select_puppy_number dog_name
end

When(/^click the Adopt Me! button$/) do
  on_page(DetailsPage).add_to_cart
  #@details.add_to_cart
  #@cart = ShoppingCartPage.new(@browser)

end
When(/^click the Adopt Another Puppy button$/) do
  #@cart.continue_adopting
  on_page(ShoppingCartPage).continue_adopting
end

## Fill checkout steps
When(/^enter "([^"]*)" in the name field$/) do |name|
  on_page(CheckoutPage).name = name
end
When(/^enter "([^"]*)" in the address field$/) do |address|
  on_page(CheckoutPage).address = address
end
When(/^enter "([^"]*)" in the email field$/) do |email|
  on_page(CheckoutPage).email = email
end
When(/^select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  on_page(CheckoutPage).pay_type = pay_type
end

Then(/^should see "([^"]*)"$/) do |expected|
  @browser.text.should include expected
end

When(/^click the Complete the Adoption button$/) do
  on_page(ShoppingCartPage).proceed_to_checkout
  #@cart.proceed_to_checkout
  #@checkout = CheckoutPage.new(@browser)
end

When(/^click the Place Order button$/) do
  on_page(CheckoutPage).place_order
end

## Cart validation steps
Then /^should see "([^"]*)" as the name for (line item \d+)$/ do |name, line_item|
  on_page(ShoppingCartPage).name_for_line_item(line_item).should include name
  #cart_line_item(line_item.to_i)[1].text.should include name
  #@cart.name_for_line_item(line_item.to_i).should include name
end

When /^should see "([^"]*)" as the subtotal for line item (\d+)$/ do |subtotal, line_item|
  on_page(ShoppingCartPage).subtotal_for_line_item(line_item.to_i).should == subtotal
  #cart_line_item(line_item.to_i)[3].text.should == subtotal
  #@cart.subtotal_for_line_item(line_item.to_i).should == subtotal
end


Then /^should see "([^"]*)" as the cart total$/ do |total|
  on_page(ShoppingCartPage).cart_total.should == total
  #@browser.td(:class => 'total_cell').text.should == total
  #@cart.cart_total.should == total

end
When(/^complete the adoption with:$/) do |table|
  # table is a | Cheezy | 123 Main Street | cheezy@example.com | Check |
  on_page(CheckoutPage).checkout(table.hashes.first)
end
When(/^complete the adoption using a Credit card$/) do
  on_page(CheckoutPage).checkout('pay_type' => 'Credit card')
end
When(/^complete the adoption$/) do
  on_page(CheckoutPage).checkout
end

When /^complete the adoption of a puppy$/ do
=begin
   on_page(HomePage).select_puppy
   on_page(DetailsPage).add_to_cart
   on_page(ShoppingCartPage).proceed_to_checkout
=end
   navigate_to(CheckoutPage).checkout
end

When /^checkout leaving the name field blank/ do
=begin
  on_page(HomePage).select_puppy_number
  on_page(DetailsPage).add_to_cart
  on_page(ShoppingCartPage).proceed_to_checkout
=end
  navigate_to(CheckoutPage).checkout('name' => '')
end

Then(/^should see the error message "([^"]*)"$/) do |message|
  @current_page.should have_error_message message
end

When(/^process the adoption$/) do
  visit_page(LoginPage)
  on_page(LoginPage).login_to_system
  on_page(AdminPage).adoptions
  on_page(AdminPage).process_adoption_for "Randy"

end
Given(/^have a pending adoption for "([^"]*)"$/) do |name|
=begin
  on_page(HomePage).select_puppy
  on_page(DetailsPage).add_to_cart
  on_page(ShoppingCartPage).proceed_to_checkout
=end
  navigate_to(CheckoutPage).checkout('name' => name)
end