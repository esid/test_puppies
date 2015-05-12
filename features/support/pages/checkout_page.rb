class CheckoutPage
  include PageObject
  include Buttons
  text_field(:name, :id => "order_name")
  text_field(:address, :id => "order_address")
  text_field(:email, :id => "order_email")
  select_list(:pay_type, :id => "order_pay_type")
  button(:place_order, :value => PLACE_ORDER)

  DEFAULT_DATA = {
      'name' => 'cheezy',
      'address' => '123 Main Street',
      'email' => 'cheezy@example.com',
      'pay_type' => 'Purchase order'
 }



  def checkout(data = {})
    populate_page_with DEFAULT_DATA.merge(data)
    place_order
=begin
     data = DEFAULT_DATA.merge(data)
     self.name = data['name']
     self.address = data['address']
     self.email = data['email']
     self.pay_type = data['pay_type']
     place_order
=end
  end

end