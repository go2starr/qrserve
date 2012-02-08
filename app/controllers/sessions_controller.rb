class SessionsController < ApplicationController
  protect_from_forgery
  include SessionsHelper

  def new
    @title = 'Login'
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

      respond_to do |format|
        format.html { redirect_to user }
        format.js
      end
    end    
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  #### SECRET DEMO LOGIN ####
  def secret
    user = User.first
    sign_in user
    flash[:notice] = "Signed in!"
    redirect_to root_path
  end
end
