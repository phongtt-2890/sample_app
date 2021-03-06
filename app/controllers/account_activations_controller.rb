class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]

    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_columns activated: true, activated_at: Time.zone.now
      log_redirect_to user
    else
      flash[:danger] = t "invalid_activation_link"
      redirect_to root_url
    end
  end

  def log_redirect_to user
    log_in user
    flash[:success] = t "account_activated"
    redirect_to user
  end
end
