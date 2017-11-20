Feature: The Login function

  Scenario: I am able to log in and access restricted resources
    Given I have access to the login page
    When I enter in the required fields
    And I submit the credentials
    Then I am taken to the logs page
    And I have access to restricted resources

  Scenario: I get an error with incorrect details
    Given I have access to the login page
    When I enter in the incorrect details on the login page
    And I submit the credentials
    Then I am returned to the login page
    And an error message is displayed

  Scenario: As a user I should be able to logout so that I can prevent further access using my account
    Given I am already logged in
    When I click the logout button
    Then I am taken to the login page
