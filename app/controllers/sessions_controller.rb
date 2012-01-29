class SessionsController < ApplicationController
  protect_from_forgery
  include SessionsHelper

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
        format.mobile { redirect_to root_path }
        format.js { redirect_to root_path }
        format.ajax { redirect_to root_path }
        format.xhr { redirect_to root_path }
      end
    end    
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
