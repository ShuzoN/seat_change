class SeatPositionController < ApplicationController
  before_action :get_users, only: [:show, :edit, :update]

  def index
    @users = User.all.order(:id)
    @users_pos = User.all.order(:position)
    gon.users = @users
  end

  def get_users
    @users = User.all.order(:id)
  end
end
