class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.search(params[:search])
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
  	@restaurant = Restaurant.new
  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
  end

def create
  @restaurant = Restaurant.new(restaurant_params)
  if @restaurant.save
      redirect_to restaurants_url(@restaurant)
        else
        render :new
  end
end


def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
          else
          render :edit
    end
end


  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
   def restaurant_params
     params.require(:restaurant).permit(:name, :description, :address, :phone_number, :category, :capacity)
   end

end


#

# class ProductsController < ApplicationController
#   def index
#     @products = Product.all
#   end

#   def show
#     @product = Product.find(params[:id])
#   end

#   def new
#     @product = Product.new
#   end

#   def edit
#     @product = Product.find(params[:id])
#   end

#   def create
#     @product = Product.new(product_params)

#     if @product.save
#       redirect_to products_url
#     else
#       render :new
#     end
#   end

#   def update
#     @product = Product.find(params[:id])

#     if @product.update_attributes(product_params)
#       redirect_to product_path(@product)
#     else
#       render :edit
#     end
#   end

#   def destroy
#     @product = Product.find(params[:id])
#     @product.destroy
#     redirect_to products_path
#   end

#   private
#   def product_params
#     params.require(:product).permit(:name, :description, :price_in_cents)
#   end
# end