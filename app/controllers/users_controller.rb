class UsersController < ApplicationController
  def new
  end

  def show
    @user - User.finder(params [:lid])
  end 
end
