class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    # lets users access their own profiles
    # except admins who can access all profiles
    if user_signed_in?
      if current_user.id != @user.id
        authorize @user
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.avatar.purge
    @user.destroy
    redirect_to root_path
    flash[:alert] = "User Deleted"
  end
end
