require_relative 'puppy'

FactoryGirl.define do
  factory :order do
    name 'Cheezy'
    address '123 Main'
    email 'cheezy@me.com'
    pay_type 'Check'


  end


  factory :adoption do
    association :order
    if ON_LOCAL
      Puppy.establish_connection(:adapter => 'sqlite3', :database => '../puppies/db/development.sqlite3' )
      puppy Puppy.find_by_name('Hanna')
    end
  end

end