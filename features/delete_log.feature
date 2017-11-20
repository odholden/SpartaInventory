Feature: Delete logs
As a user
I should be able to delete a log so that if I make a mistake I can remove an incorrect log

@delete_log 
Scenario: Delete a log
  Given I am signed in
  And I am on the logs page
  When I click delete
  And I click ok on the confirmation
  Then the log is removed from the database
  And I am returned to the logs page
