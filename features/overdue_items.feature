Feature: Overdue items
As an admin
I should be able to see which items are overdue in the list of items so that I can quickly asses who needs to be contacted

@overdue_items
Scenario: View overdue items
  Given that I am on the item list page
  When there are items for where the return date is the same as or earlier than the current date
  Then the return date will be coloured red in the list
