class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "create_user_success"
      redirect_to @user
    else
      flash.now[:danger] = t "create_user_fail"
      render :new
    end
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def edit
    @user = User.find_b id: params[:id]
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end
end
