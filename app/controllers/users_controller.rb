class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
      @user = User.all
      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end