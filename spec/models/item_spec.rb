describe Item do
	
	it "is invalid without an academy" do
		expect(build(:item, academy_id: nil)).to be_invalid
	end

	it "is invalid without a description" do
		expect(build(:item, description: nil)).to be_invalid
	end

	it "is invalid without a serial" do
		pending
		expect(build(:item, serial: nil)).to be_invalid
	end

	it "is invalid with a duplicate serial" do
		pending
		item = create(:item, serial: "NOTE_8")
		expect(build(:item, serial: "NOTE_8")).to be_invalid
		item.destroy
	end

	before(:all) do
		@academy = create(:academy, id:1)
	end

	after(:all) do
		@academy.destroy
	end

end

