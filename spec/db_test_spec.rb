
describe 'Verifying the seed data' do

  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it 'should have the model value of Macbook2010' do
    # expect(Item.first.item_model).to eq("Macbook2010")
  end
end
