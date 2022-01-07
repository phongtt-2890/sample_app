class FollowingsController < ApplicationController
  before_action :load_user, only: %i(create)

  def create
    @title = t "following"
    @pagy, @users = pagy @user.following.newest,
                         items: Settings.microposts_per_page
    render "users/show_follow"
  end
end
