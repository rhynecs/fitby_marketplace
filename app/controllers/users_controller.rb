class UsersController < ApplicationController
  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    # lets users access only their own profiles
    # except admins who can access all profiles
    if current_user.id != @user.id
      authorize User
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.avatar.purge
    @user.destroy
    redirect_to root_path
    flash[:alert] = "User Deleted"
  end

  def edit
    @user = User.find(params[:id])
    # lets users edit only their own profiles
    # except admins who can access all profiles
    if current_user.id != @user.id
      authorize User
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user.id != @user.id
      authorize User
    end
    if @user.update(user_update_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def user_update_params
      params.require(:user).permit(:first_name, :last_name, :birth_date, :phone_number, :bio, :listing)
    end
end
