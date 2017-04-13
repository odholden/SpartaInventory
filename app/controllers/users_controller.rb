class UsersController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def show

    @user = User.find params[:id]

      render :'users/show'

  end

  def edit
  end

  def update
  end

  def delete
  end

  def new
  end

  def create
  end
end
