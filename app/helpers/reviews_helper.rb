module ReviewsHelper

	def star_rating(number)

		return number unless number.respond_to?(:round)
		rounded = number.round
		filled_stars = '★' * rounded 
		empty_stars = '☆' * (5 - rounded) 
		filled_stars + empty_stars

		# ★★★★★
	end


end
