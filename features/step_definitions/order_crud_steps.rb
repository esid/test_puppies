Given(/^I know how many orders I have$/) do
  @number_orders = Order.count
end
When(/^create a new order$/) do
  create(:order)
end
Then(/^should have (\d+) additional order$/) do |additional_orders|
  Order.count.should == @number_orders + additional_orders.to_i
end
Given(/^an order for "([^"]*)"$/) do |name|
  create(:order, :name => name)
  @original_name = name
end
When(/^read that order$/) do
  @order = Order.find_by_name(@original_name)
end
Then(/^the order should have the name "([^"]*)"$/) do |name|
  @order.name.should == name
end
When(/^update the name to "([^"]*)"$/) do |name|
  order = Order.find_by_name(@original_name)
  order.name = name
  order.save
end
Then(/^should not have a record for "([^"]*)"$/) do |name|
  order = Order.find_by_name(name)
  order.should be_nil
end
When(/^should have a record for "([^"]*)"$/) do |name|
  order = Order.find_by_name(name)
  order.should_not be_nil
end
When(/^delete that order$/) do
  order = Order.find_by_name(@original_name)
  order.delete
end