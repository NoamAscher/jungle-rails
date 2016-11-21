# Controller is responsible for loading data
# from the model (@user = User.find(1))
# then passing that data to the view
class ProfilesController < ApplicationController
# redirect to login if not logged in
  # before action, authenticate user

  def edit
  end

  def show
    @user = User.find(session[:user_id])
    # render /profiles/show
  end

  def update
  end

end
