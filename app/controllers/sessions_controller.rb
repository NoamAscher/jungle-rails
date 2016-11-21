class SessionsController < ApplicationController
  def new
  end

  def create
    #binding.pry
    # log them in, redirect
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to profile_path, notice: "User logged in for #{@user.email}"
    else
      # Create an error message.
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_path
  end

end
