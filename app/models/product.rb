class Product < ActiveRecord::Base
	has_many :components, dependent: :destroy

	accepts_nested_attributes_for :components, allow_destroy: true


	def total_price
		total = self.price || 0
		self.components.each do |component|
		    total += component.price || 0
		end
		total
	end
end
