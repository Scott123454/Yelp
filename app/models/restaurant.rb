class Restaurant < ActiveRecord::Base

validates :name, presence: true, format: {with: /\A[A-Z]/, message: 'must begin with a capital'}
validates :address, presence: true
validates :cuisine, presence: true

has_many :reviews


	def average_rating
		if reviews.any?
			reviews.average(:rating)
			# reviews.inject(0) {|total, review|
			# total + review.rating
			# } / reviews.count.to_f
		else
		'N/A'
	  end
	end
end
