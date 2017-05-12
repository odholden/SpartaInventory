class Log < ApplicationRecord
  
  belongs_to :item

  def borrower
    if self.borrower_id == nil || self.borrower_id == ""
      return nil
    end

    if @borrower 
      return @borrower
    end

    @borrower = User.find self.borrower_id
  end

  def lender
    if self.lender_id == nil || self.lender_id == ""
      return nil
    end

    if @lender 
      return @lender
    end

    @lender = User.find self.lender_id

  end

  def returned_to
    if self.returned_to_id == nil || self.returned_to_id == ""
      return nil
    end

    if @returned_to 
      return @returned_to
    end

    @returned_to = User.find self.returned_to_id
  end


end