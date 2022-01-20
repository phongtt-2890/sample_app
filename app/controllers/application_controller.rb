class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "please_login"
    redirect_to login_url
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

  protect_from_forgery with: :exception
  include SessionsHelper
end
