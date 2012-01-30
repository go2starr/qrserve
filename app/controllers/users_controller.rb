class UsersController < ApplicationController

  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.save
      sign_in @user

      respond_to do |format|
        format.html { redirect_to user_path @user }
        format.js
      end
      
    else
      render 'new'
    end
  end

  def show
#    @title = "Profile"
    @user = User.find params[:id]
  end

  def update
  end

  def destroy
  end

end
