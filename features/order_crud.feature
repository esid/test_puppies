Feature: CRUD works for orders

  Scenario: Creating a new order in the database
    Given I know how many orders I have
    When create a new order
    Then should have 1 additional order

  Scenario: Read an order object from the database
    Given an order for "George Washington"
    When read that order
    Then the order should have the name "George Washington"

  Scenario: Updating an order object
    Given an order for "Goofy"
    When update the name to "Minnie"
    Then should not have a record for "Goofy"
    And should have a record for "Minnie"

  Scenario: Delete an order object
    Given an order for "Daisey Duck"
    When delete that order
    Then should not have a record for "Daisey Duck"
