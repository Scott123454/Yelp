
  json.thoughts @review.thoughts
  json.star_rating star_rating(@review.rating)

  json.restaurant do

  	json.average_rating number_with_precision(@restaurant.average_rating, precision: 1)
  	json.average_rating_stars star_rating(@restaurant.average_rating)
	json.review_count(@restaurant.average_rating)
  
  end

  