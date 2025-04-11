class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    if params[:query].present?
      @restaurants = @restaurants.where("name ILIKE ?", "%#{params[:query]}%")
    end
    if params[:category].present? && params[:category] != "All"
      @restaurants = @restaurants.where(category: params[:category])
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant created successfully!"
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:alert] = "Please correct the errors below."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
