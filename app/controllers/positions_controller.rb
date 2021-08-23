# frozen_string_literal: true

class PositionsController < ApplicationController
  before_action :set_positions, only: %i[index]
  before_action :set_position, only: %i[edit update destroy]

  def index; end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      @position_history = PositionHistory.create(name: @position.name, position_id: @position.id, begin_date: @position.created_at)
      redirect_to action: 'index'
    else
      render :new
    end

  end

  def edit; end

  def update
    @last_position = PositionHistory.where(position_id: @position.id, end_date: nil)
    byebug
    if @position.update(position_params)
      @last_position.first.update(end_date: Time.now)
      @position_history = PositionHistory.create(name: @position.name, position_id: @position.id, begin_date: Time.now)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @position.destroy
    redirect_to action: 'index'
  end

  private

  def set_positions
    @positions = Position.all
  end

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:name)
  end
end
