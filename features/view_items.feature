Feature: View items
As a user
I should be able to see the lender and borrower on the items page so I can see easily if an item is available

@view_items
Scenario: View borrower and lender of each checked out item
  Given that I am on the items page
  And that there are items which are checked out
  Then the lender and the borrower names will be visible for that item in the list
