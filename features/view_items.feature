Feature: view items
As a user
I should be able to see the lender and borrower on the items page so I can see easily if an item is available

@view_items
Scenario: If I am a user I can see the borrower and lender of each checked out item
  Given That I am on the items page
  And That there are items which are checked out
  Then I expect the lender and the borrower to be visible for that item in the list
