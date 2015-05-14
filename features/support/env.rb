require 'rspec'
require 'page-object'
require 'data_magic'
require 'require_all'
require 'factory_girl'
require 'fig_newton'

World(PageObject::PageFactory)

World(FactoryGirl::Syntax::Methods)

require_all File.dirname(__FILE__) + '/pages'

PageObject::PageFactory.routes = {
    :default => [[HomePage, :select_puppy],
                 [DetailsPage, :add_to_cart],
                 [ShoppingCartPage, :proceed_to_checkout],
                 [CheckoutPage, :checkout]],
}


ON_LOCAL = ENV["LOCAL"]