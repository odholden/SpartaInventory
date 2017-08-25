Feature: Login
  System Administrator should be able to login in succesfully

  Background:
    Given I am on the Sparta Inventory login page

  Scenario: Login in successfully
    And I fill in the required fields to login
    When I click on login
    Then I should be logged in and redirected to the logs page
