class Log < ApplicationRecord
  belongs_to :item

  attr_accessor :borrower, :lender , :returned_to

  after_initialize do
    if self.new_record?
      self.due_date = Date.today + 1
    end
  end
end