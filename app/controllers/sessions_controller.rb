class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                    params[:user][:password])
    if @user.nil?
      flash.now[:errors] = "incorrect email or password"
      render :new
    else
      log_in_user!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    log_out_user!(current_user)
    redirect_to new_session_url
  end
end

# params = { user: { name: "max", id: 2} id: 2}
#
# User.find(params[:id])
#
# params[:user][:id]
# /users/2
