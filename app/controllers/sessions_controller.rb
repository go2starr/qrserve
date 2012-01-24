class SessionsController < ApplicationController
  protect_from_forgery
  include SessionsHelper

  def new
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])

    if user.nil?
      # Sign in failure
      render 'new'
    else
      # Sign in the user
      sign_in user
      redirect_to user
    end    
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
