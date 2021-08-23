# frozen_string_literal: true

class PositionHistoriesController < ApplicationController
  before_action :set_position_historys, only: %i[index]
  before_action :set_position_history, only: %i[edit update destroy]

  def index; end

  def new
    @position_history = PositionHistory.new
  end

  def create
    @position_history = PositionHistory.new(position_history_params)

    if @position_history.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @position_history.update(position_history_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @position_history.destroy
    redirect_to action: 'index'
  end

  private

  def set_position_historys
    @position_histories = PositionHistory.all
  end

  def set_position_history
    @position_history = PositionHistory.find(params[:id])
  end

  def position_history_params
    params.require(:position_history).permit(:name)
  end
end
