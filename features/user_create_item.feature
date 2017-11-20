Feature: Item usage

  Scenario: As a user I should be able to see the items
    Given I am already logged in
    When I click on the items link
    Then I am taken to the items page
    And I can see all of the items in the database

  Scenario: I should be able to create an item
    Given I am already logged in
    And I am on the create new items page
    When I enter in a description and a serial
    And I click save item
    Then a record is created
    And the record is displayed

  Scenario: As a user I should be able to checkout an item so that I can keep a record of all of the people who hold items
    Given I am already logged in
    And I am on the checkout item page
    When I select an item and a borrower
    And click the checkout item button
    Then a log is created
    And I am taken to the show log page

  Scenario: As a user I should be able to check in an item so that I can keep a record of returned items
    Given I am already logged in
    And I am on the logs page
    When I click check-in for a log
    And confirm by clicking ok
    Then the returned to and return date are set
    And the log appears as returned
    And I am returned to the logs page
