# frozen_string_literal: true

class UsersController < ApplicationController
  attr_reader :boo
  before_action :set_users, only: %i[index]
  before_action :set_user, only: %i[edit update destroy show]

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to action: 'index'
  end

  def shooow
      @user = User.find(2)
      @position_history = EmploymentTerm.where(user_id: @user)
      @boo=params[:attribute]
      @position_history_date_filter = @position_history.where(position_id: @boo)
      redirect_to 'http://[::1]:3000/users/2'
  end


  def show
    @position_history = EmploymentTerm.where(user_id: @user)
  end

  private

  def set_users
    @users = User.all
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:l_name, :f_name, :s_name)
  end
end
