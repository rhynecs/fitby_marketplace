class ListingsController < ApplicationController
  # def show
  #   @user = User.find(params[:user_id])
  #   @listing = @user.listing.create(listing_params)
  # end

  def index
    @listings = Listing.all
  end

  def new
    @listing = User.find(current_user.id).listings.build
  end

  def create
    @listing = User.find(current_user.id).listings.new(listing_params)

    if @listing.save
      redirect_to @listing
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def listing_params
      params.require(:listing).permit(:title, :body, :city, :price, :address_line_1, :address_line_2, :postcode, :image)
    end
end
