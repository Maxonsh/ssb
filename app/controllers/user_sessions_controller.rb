class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)

    if @user_session.save!
      redirect_to root_path, :notice => 'Successfully logged in'
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url, :notice => 'Successfully logged out'
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
