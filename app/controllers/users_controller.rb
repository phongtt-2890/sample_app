class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :load_user, except: %i(index new create)
  before_action :correct_user, only: %i(edit update)

  def index
    @pagy, @users = pagy User.all, items: Settings.user_per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "check_email_to_active"
      redirect_to login_url
    else
      flash.now[:danger] = t "create_user_fail"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "profile_updated"
      redirect_to @user
    else
      flash.now[:danger] = t "update_user_fail"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
    else
      flash[:danger] = t "delete_user_fail"
    end
    redirect_to users_url
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end
end
