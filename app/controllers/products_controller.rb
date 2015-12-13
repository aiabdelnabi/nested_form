class ProductsController < ApplicationController
	before_action :load_product, only: [:show, :edit, :update]

	def index
		@products = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:success] = "Product created successfully"
			redirect_to products_url
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		check = @product.update(product_params)
		if check
			flash[:success] = "Product updated successfully"
			redirect_to products_url
		else
			render 'edit'
		end
	end

	private

		def load_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name, :price, components_attributes: [:id, :name, :price, :_destroy])
		end
end
