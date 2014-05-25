require 'spec_helper'

describe Restaurant do
  it 'is not valid without a name' do
  	restaurant = Restaurant.new(name:nil)
  	expect(restaurant).to have(2).errors_on(:name)
  	expect(restaurant.valid?).to eq false
  end


  it 'is not valid without an address' do
  	restaurant = Restaurant.new(address:nil)
  	expect(restaurant).to have(1).errors_on(:address)
  end

  it 'is not valid without a cuisine' do
  	restaurant = Restaurant.new(cuisine:nil)
  	expect(restaurant).to have(1).errors_on(:cuisine)
  	expect(restaurant.valid?).to eq false
  end

end

 describe '#average_rating' do
 	let(:restaurant) {Restaurant.create(name: 'KFC', address: '1 High Street', cuisine: 'chicken')}

    it 'intially returns N/A' do
        expect(restaurant.average_rating).to eq 'N/A'	
    end

    context '1 review' do
    	before {restaurant.reviews.create(rating: 3)}

    	it 'returns the score of that review' do
    		expect(restaurant.average_rating).to eq 3
      end
    end

    context '> 1 review' do
    	before do
    		restaurant.reviews.create(rating: 3)
    		restaurant.reviews.create(rating: 5)
    	end

    	it 'returns the score of that review' do
    		expect(restaurant.average_rating).to eq 4

      	end
    end

    context 'non-integer average' do
    	before do
    		restaurant.reviews.create(rating: 2)
    		restaurant.reviews.create(rating: 5)

    	it 'does not round up or down' do
    		expect(retsaurant.average_rating).to eq 3.5

    	  end
    	end


    end
end