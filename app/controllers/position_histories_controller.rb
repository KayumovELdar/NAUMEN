# frozen_string_literal: true

class PositionHistoriesController < ApplicationController
  before_action :set_position_historys, only: %i[index]

  def index; end
  def create
  end

  def update
  end

  private

  def set_position_historys
    @position_histories = PositionHistory.all
  end

  def position_history_params
    params.require(:position_history).permit(:name, :position_id, :begin_date,:end_date)
  end
end
