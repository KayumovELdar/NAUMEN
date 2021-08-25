# frozen_string_literal: true

class EmploymentTermsController < ApplicationController

  before_action :set_employment_terms, only: %i[index]
  before_action :set_employment_term, only: %i[edit update update_end_date]
  def index
  end

  def new
    @employment_term = EmploymentTerm.new
  end

  def create
    @employment_term = EmploymentTerm.new(employment_term_params)

    if @employment_term.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employment_term.update(employment_term_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def update_end_date
    if @employment_term.update(employment_term_params)
      redirect_to action: 'index'
    else
      render plain:"Параметр не был обнавлен!!!"
    end
  end

  private

  def set_employment_terms
    @employment_terms = EmploymentTerm.all
  end

  def set_employment_term
    @employment_term = EmploymentTerm.find(params[:id])
  end

  def employment_term_params
    params.require(:employment_term).permit(:user_id, :position_id, :end_date)
  end
end
