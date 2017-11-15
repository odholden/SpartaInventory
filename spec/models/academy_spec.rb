describe Academy do

	it "is invalid without a name" do
		academy = build(:academy, name: nil)
		expect(academy).to be_invalid
	end

	it "is invalid with a duplicate name" do
		build(:academy, name: "Ollieland").save
		academy = create(:academy, name: "Ollieland")
		expect(academy).to be_invalid
	end

end