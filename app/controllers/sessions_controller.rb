class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate params[:session][:password]
      if user.activated?
        log_in_redirect user
      else
        flash[:warning] = t "not_activated"
        redirect_to root_url
      end
    else
      flash.now[:danger] = t "invalid_email_password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_url
  end

  def log_in_redirect user
    log_in user
    remember_checked? user
    redirect_back_or user
  end
end
