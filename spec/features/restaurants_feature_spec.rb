require 'spec_helper'


describe 'restaurants index page' do
	context 'no restaurants have been added' do
		it 'should display a message' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
		end
	end
end

describe 'creating a restaurant' do

	context 'logged out' do
		it 'takes us to the sign up page' do
			visit '/restaurants'
			click_link 'Create a restaurant'
			expect(page).to have_content 'Sign up'
		end
	end


context 'logged in' do
	before do
		user = User.create(email: 'scott@d.com', password: '123454', password_confirmation: '123454')
		login_as user
	end
    	it 'adds it to the restaurants index' do
    		visit '/restaurants/new'
    		fill_in 'Name', with: 'McDonalds'
    		fill_in 'Address', with: 'City Road, London'
    		fill_in 'Cuisine', with: 'Chicken'
    		click_button 'Create Restaurant'
    		expect(current_path).to eq '/restaurants'
    		expect(page).to have_content 'McDonalds'
    	end
    end
end

describe ' editing a restaurant' do
	before {Restaurant.create(name: 'KFC', address: '1High St, London', cuisine: 'chicken')}

	# context 'logged out' do
	# 	it 'does not show the review form' do
	# 	visit '/restaurants'
	# 	expect(page).not_to have_link 'Edit KFC'
	#     end
	# end

	# context 'logged in' do


	    it 'saves the change to the restaurant' do
	    	visit '/restaurants'
	    	click_link 'Edit KFC'
	    	fill_in 'Name', with: 'Kentucky Fried Chicken'
	    	click_button 'Update Restaurant'
	    	expect(current_path).to eq '/restaurants'
	    	expect(page).to have_content 'Kentucky Fried Chicken'
	    end
    # end
end

describe 'deleting a restaurant' do
	before {Restaurant.create(name: 'Chicken Cottage', address: '2High St, London', cuisine: 'chicken')}

	it'destroys a restaurant' do
		visit '/restaurants'
		click_link 'Delete Chicken Cottage'
		expect(page).not_to have_content 'Chicken Cottage'
		expect(page).to have_content 'Restaurant DESTROYED'
	end
end

describe 'user can only enter valid data' do
  
  context 'user enters invalid data' do
	it 'does not add it to the restaurants index' do
		visit '/restaurants/new'
		fill_in 'Name', with: 'mcDonalds'
		fill_in 'Address', with: 'lowercase'
		# no cuisine fill_in
		click_button 'Create Restaurant'
		expect(page).to have_content 'errors'
	    end
	end

end








