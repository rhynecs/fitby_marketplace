class ListingsController < ApplicationController
  # def show
  #   @user = User.find(params[:user_id])
  #   @listing = @user.listing.create(listing_params)
  # end

  def index
    @listings = Listing.all
  end
  
  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = User.find(current_user.id).listings.build
  end

  def create
    @listing = User.find(current_user.id).listings.new(listing_params)

    if @listing.save
      redirect_to root_path
    else
      flash[:alert] = "Invalid details"
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    if current_user.id != @listing.user_id
      authorize User
    end
    @listing.destroy
    redirect_to root_path
    flash[:alert] = "User Deleted"
  end

  private
    def listing_params
      params.require(:listing).permit(:title, :body, :city, :price, :address_line_1, :address_line_2, :postcode, :main_image)
    end
end
