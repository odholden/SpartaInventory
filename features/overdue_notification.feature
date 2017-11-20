Feature: Overdue notification
As a lender
I want to receive a notification when an item is overdue for return

@overdue_notification
Scenario: Recieve a notification for overdue item
  Given that I have checked out an item
  And the item has not been returned
  And that I have set a date for its return
  When that date is reached
  Then I expect the lender to receive a notification
