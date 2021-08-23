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
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @position.update(position_params)
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
