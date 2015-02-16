class ReservationsController < ApplicationController
 #add create and update to reservations
 before_filter :load_restaurant

 def show
  @reservation = Reservation.find(params[:id])
end

	def new
    @reservation = Reservation.new
  end

  def create
    #create new method based on rainforest
    #make a new reservation for restaurant object put it int the reservation object
    #collection.build(attributes) returns one or more new objects of the collection type
    #that has been instantiated with attributes and linked to this object through a foreign key, but 
    #not yet saved, only works when associated object already exists
  	@reservation = @restaurant.reservation.build(reservation_params)
    @reservation.user = current_user

    # Check out this article on [.build](http://stackoverflow.com/questions/783584/ruby-on-rails-how-do-i-use-the-active-record-build-method-in-a-belongs-to-rel)
    # You could use a longer alternate syntax if it makes more sense to you
    # 
    # @review = Review.new(
    #   comment: params[:review][:comment],
    #   product_id: @product.id,
    #   user_id: current_user.id
    # )

    if @reservation.save
      redirect_to restaurant_path(params[:restaurant_id]), notice: 'Your reservation has been saved.'
    else
      flash[:alert] = @reservation.errors.full_messages.to_sentence
      redirect_to new_restaurant_reservation_path(@restaurant, @reservation)
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    
    end
  end


	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to restaurant_path, notice: "Your reservation was cancelled."

	end

 private
  def reservation_params
  	params.require(:reservation).permit(:party_size, :date, :time)
  end

def load_restaurant
    @restaurant = Restaurant.find(params[:product_id])
  end

end