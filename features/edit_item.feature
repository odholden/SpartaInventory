Feature: Edit items
As a user
I should be able to edit an Item so that I can make corrections to the item

@edit_item
Scenario: Edit created items
  Given I am logged in
  And I am on the edit item page
  When I change the details
  And click save item
  Then I am taken to the show page for the item
  And the item details are changed in the database
