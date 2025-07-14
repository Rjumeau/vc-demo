class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @users = User.teaching_staff.order_by_tickets_count
  end

  def show
    User.find(params[:id])
  end
end
