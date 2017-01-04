  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @tasks = Task.where(user_id: @user.id).page(params[:page]).per(5).order("created_at DESC")
    end
  end