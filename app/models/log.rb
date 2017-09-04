class Log < ApplicationRecord
  
  
  belongs_to :item

  attr_accessor :borrower, :lender , :returned_to

end