Feature: Overdue items
As an admin
I should be able to create an academy

@create_academy
Scenario: If I am an admin I should be able to create an academy
  Given that I am logged in
  When I enter an academy name
  And I choose an academy inventory manager from a list of administrators
  And I submit the data
  Then I expect a new academy to be created in the database
