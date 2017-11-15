describe Academy do

	it "is invalid without a name" do
		expect(build(:academy, name: nil)).to be_invalid
	end

	it "is invalid with a duplicate name" do
		pending
		academy = create(:academy, name: "Ollieland")
		expect(build(:academy, name: "Ollieland")).to be_invalid
		academy.destroy
	end

end