Feature: Adopting puppies
   As a puppy lover
   I want to adopt puppies
   So they can chew my furniture

  Background:
    Given I am on the puppy adoption site


  Scenario: Adopting a puppy using a table
   When I click the View Details button for Brook
   And I click the Adopt Me! button
   And I click the Complete the Adoption button
   And I complete the adoption with:
    | name | address | email | pay_type |
    | Cheezy | 123 Main Street | cheezy@example.com | Check |
   Then I should see "Thank you for adopting a puppy!"

  Scenario Outline: Adopting puppies
   When I click the View Details button for <dog>
   And I click the Adopt Me! button
   And I click the Complete the Adoption button
   And I enter "<name>" in the name field
   And I enter "<address>" in the address field
   And I enter "<email>" in the email field
   And I select "<pay_type>" from the pay with dropdown
   And I click the Place Order button
   Then I should see "Thank you for adopting a puppy!"

  Examples:
  | dog  | name | address | email | pay_type |
  | Brook | Cheezy | 123 Main St | cheezy@example.com| Credit card |
  | Hanna | Joseph | 555 South St| joe@guru.com | Check |
  | Maggie Mae | Jared | 234 Leandog | doc@dev.com | Purchase order|


  Scenario: Adopting a puppy using partial default data
     When I click the View Details button for Brook
     And I click the Adopt Me! button
     And I click the Complete the Adoption button
     And I complete the adoption using a Credit card
     Then I should see "Thank you for adopting a puppy!"

  Scenario: Adopting a puppy using all default data
      When I click the View Details button for Brook
      And I click the Adopt Me! button
      And I click the Complete the Adoption button
      And I complete the adoption
      Then I should see "Thank you for adopting a puppy!"