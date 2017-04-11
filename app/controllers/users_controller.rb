class UsersController < ApplicationController
  helper_method :resource_user

  def new
    @resource_user = User.new
  end

  def create
    @resource_user = User.new(user_params)

    if @resource_user.save!
      redirect_to new_user_path, :notice => 'Registration successful'
    else
      flash.now[:error] = 'User not created'
      render :new
    end
  end

  def edit
    @resource_user = current_user
  end

  def update
    @resource_user = current_user
    if @resource_user.update_attributes(user_params)
      flash[:notice] = "Successfully updated profile"
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  private

  def resource_user
    @resource_user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :address, :email, :phone_number, :password, :password_confirmation)
  end
end
