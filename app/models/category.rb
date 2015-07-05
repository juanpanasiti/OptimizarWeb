class Category < ActiveRecord::Base

	# Validates
	validates :name, presence: true, length: {maximum: 25}, uniqueness: true
	validates :color, length: {maximum: 7}

	has_many :has_categories
	has_many :articles, through: :has_categories

end
