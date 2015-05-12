Feature: Adopting puppies
   As a puppy lover
   want to adopt puppies
   So they can chew my furniture

  Background:
    Given am on the puppy adoption site


  Scenario: Adopting a puppy using a table
   When click the View Details button for Brook
   And click the Adopt Me! button
   And click the Complete the Adoption button
   And complete the adoption with:
    | name | address | email | pay_type |
    | Cheezy | 123 Main Street | cheezy@example.com | Check |
   Then should see "Thank you for adopting a puppy!"

  Scenario Outline: Adopting puppies
   When click the View Details button for <dog>
   And click the Adopt Me! button
   And click the Complete the Adoption button
   And enter "<name>" in the name field
   And enter "<address>" in the address field
   And enter "<email>" in the email field
   And select "<pay_type>" from the pay with dropdown
   And click the Place Order button
   Then should see "Thank you for adopting a puppy!"
  Examples:
  | dog  | name | address | email | pay_type |
  | Brook | Cheezy | 123 Main St | cheezy@example.com| Credit card |
  | Hanna | Joseph | 555 South St| joe@guru.com | Check |
  | Maggie Mae | Jared | 234 Leandog | doc@dev.com | Purchase order|


  Scenario: Adopting a puppy using partial default data
     When click the View Details button for Brook
     And click the Adopt Me! button
     And click the Complete the Adoption button
     And complete the adoption using a Credit card
     Then should see "Thank you for adopting a puppy!"

  Scenario: Adopting a puppy using all default data
      When click the View Details button for Brook
      And click the Adopt Me! button
      And click the Complete the Adoption button
      And complete the adoption
      Then should see "Thank you for adopting a puppy!"

  Scenario: Verify message when adoption is processed
    Given have a pending adoption for "Tom Jones"
    When  process the adoption
    Then should see "Please thank Tom Jones for the order!"