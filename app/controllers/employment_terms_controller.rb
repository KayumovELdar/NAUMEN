# frozen_string_literal: true

class EmploymentTermsController < ApplicationController
  def index
    @employment_terms = EmploymentTerm.all
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
    @employment_term = EmploymentTerm.find(params[:id])
  end

  def update
    @employment_term = EmploymentTerm.find(params[:id])
    if @employment_term.update(employment_term_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def update_end_date
    @employment_term = EmploymentTerm.find(params[:id])
    redirect_to action: 'index' if @employment_term.update(employment_term_params)
  end

  def employment_term_params
    params.require(:employment_term).permit(:user_id, :position_id, :end_date)
  end
end
