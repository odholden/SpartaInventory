FactoryGirl.define do
	factory :academy do
		name "The Ollie School of Ollie"
	end

	factory :item do
		description "Frankly the best bloody laptop you could imagine"
		serial "NOTE-8"
		academy_id 1
	end

	factory :log do
		date Faker::Date.between(2.days.ago, Date.today) 
		notes "Pariatur duis mollit amet minim dolor sint cillum laboris incididunt. Ea et ut ad veniam incididunt ex culpa nisi voluptate aliquip ut. Deserunt incididunt laboris laboris pariatur nulla sit id reprehenderit cillum voluptate cillum eiusmod eu."
		due_date Faker::Date.forward(1)
		return_date Faker::Date.forward(0)
		lender_id "1"
		borrower_id "1"
		returned_to_id "1"
		item_id 1
	end
end

