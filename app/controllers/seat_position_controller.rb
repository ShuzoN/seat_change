class SeatPositionController < ApplicationController
  before_action :get_users, only: [:show, :edit, :update]

  def index
    @users = User.all.order(:id)
  end

  def get_users
    @users = User.all.order(:id)
  end
end
