Feature: User commands
As a user
I should be able to delete a log so that if I make a mistake I can remove an incorrect log
I should be able to edit an Item so that I can make corrections to the item
I should be able to see the lender and borrower on the items page so I can see easily if an item is available

@view_items
Scenario: View borrower and lender of each checked out item
  Given that I am on the items page
  And that there are items which are checked out
  Then the lender and the borrower names will be visible for that item in the list

@edit_item
Scenario: Edit created items
  Given I am logged in as a user
  And I am on the edit item page
  When I change the details
  And click save item
  Then I am taken to the show page for the item
  And the item details are changed in the database

@delete_log
Scenario: Delete a log
  Given I am logged in as a user
  And I am on the logs page
  When I click delete
  And I click ok on the confirmation
  Then the log is removed from the database
  And I am returned to the logs page
