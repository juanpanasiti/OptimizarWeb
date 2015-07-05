class Article < ActiveRecord::Base
	has_many :comments
	has_many :has_categories
	has_many :categories, through: :has_categories


	# Validaciones
	validates :title, presence: true, length: {maximum: 100, minimum: 5}
	validates :body, presence: true, length: {minimum: 100}

	before_create :set_visitsCount
	after_create :save_categories
	#Otros ejemolos de callbacks:
	# before_create - after_create :nombre_funcion					,on: :create
	# before_save - after_save :set_algo										,on: :accion
	# before_validation - after_validation	

	# Scopes
	scope :publishable, ->{ where(published: true) }
	scope :latest, ->{ order("created_at DESC") }
	scope :article_html, ->{Sanitize.fragment(self.body, Sanitize::Config::RELAXED)}
	# Sanitize.fragment(@article.body, Sanitize::Config::RELAXED).html_safe

	# Funciones
	def categories=(value)
		@categories = value
	end

	def update_visitsCount
		self.visitsCount ||= 0
		self.update(visitsCount: self.visitsCount + 1)
	end
	private
	def save_categories
		unless @categories.nil?
			@categories.each do |category_id|
				HasCategory.create(category_id: category_id, article_id: self.id)
			end
		end
	end
	def set_visitsCount
		self.visitsCount = 0		
	end
end
