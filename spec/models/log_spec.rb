describe Log do
	
	it "is invalid without an item" do
		expect(build(:log, item_id: nil)).to be_invalid
	end

	it "is invalid without a borrower" do
		pending "Log model validation"
		expect(build(:log, borrower_id: nil)).to be_invalid
	end

	it "is invalid without a lender" do
		pending "Log model validation"
		expect(build(:log, lender_id: nil)).to be_invalid
	end

	before(:all) do
		@academy = create(:academy, id: 1)
		@item = create(:item, id: 1, academy_id: 1)
	end

	after(:all) do
		@academy.destroy
		@item.destroy
	end
end