class FollowersController < ApplicationController
  before_action :load_user, only: %i(create)

  def create
    @title = t "followers"
    @pagy, @users = pagy @user.followers.newest,
                         items: Settings.microposts_per_page
    render "users/show_follow"
  end
end
