Feature: Inventory Page

  Background: The user in the inventory page
    Given A user will be logged he is in the inventory page


  Scenario: Validate the number of inventory results
    Then I should see that the number is equal to 6

  Scenario: Validate the presence of the Sauce Labs Bolt T-Shirt in inventory
    Then I should for the "Sauce Labs Bolt T-Shirt" product

