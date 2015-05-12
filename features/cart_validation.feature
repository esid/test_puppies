

Feature: Shopping cart

  Background:
    Given am on the puppy adoption site

  Scenario: Validate cart with one puppy
   When click the View Details button for Brook
   And click the Adopt Me! button
   Then should see "Brook" as the name for line item 1
   And should see "$34.95" as the subtotal for line item 1
   And should see "$34.95" as the cart total

  Scenario: Validate cart with two puppies
    When click the View Details button for Brook
    And click the Adopt Me! button
    And click the Adopt Another Puppy button
    And click the View Details button for Hanna
    And click the Adopt Me! button
    Then should see "Brook" as the name for line item 1
    And should see "$34.95" as the subtotal for line item 1
    And should see "Hanna" as the name for line item 2
    And should see "$22.99" as the subtotal for line item 2
    And should see "$57.94" as the cart total


  Scenario: Name is a required field
    When checkout leaving the name field blank
    Then should see the error message "Name can't be blank"