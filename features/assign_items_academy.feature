Feature: Assign items to academy
As an admin
I should be able to assign an item to an academy so that I can see where that item is kept

@assign_items_academy
Scenario: View overdue items
  Given that I am on the create/edit item page
  When I select an academy from a list of those available
  And I save the record
  Then I expect the record to be associated with that academy
