class ListingsController < ApplicationController
  # def show
  #   @user = User.find(params[:user_id])
  #   @listing = @user.listing.create(listing_params)
  # end

  def create
    @user = User.find(params[:id])
    @listing = @user.listings.create(listing_params)
    redirect_to root_path
  end

  private
    def listing_params
      params.require(:title, :body, :city, :price).permit(:address_line_1, :address_line_2, :postcode, :image)
    end
end
