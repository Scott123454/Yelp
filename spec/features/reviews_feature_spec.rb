require 'spec_helper'

describe 'writing reviews' do
	before {Restaurant.create(name: 'Nandos', address: '1High St, London', cuisine: 'chicken')}

	specify 'restaurants begin with no reviews' do	
	visit '/restaurants'
	expect(page).to have_content '0 reviews'
	
	end

	it'adds the review to the restaurant' do
		visit '/restaurants'
		click_link 'Review Nandos'
		fill_in 'Thoughts', with: 'This was decent'
		select '4', from: 'Rating'
		click_button 'Leave Review'
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'This was decent'
		expect(page).to have_content '1 review'
	end

	it 'calculates the average of reviews' do
		leave_review(4, 'This was decent')
		leave_review(2, 'Poor')
		expect(page).to have_content 'Average rating: 3'
	end



	def leave_review(rating, thoughts)
		visit '/restaurants'
		click_link 'Review Nandos'
		fill_in 'Thoughts', with: 'thoughts'
		select rating.to_s, from: 'Rating'
		click_button 'Leave Review'
	end


end