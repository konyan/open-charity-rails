class Admin::CharitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_charity, only: [:show, :destroy]

  def index
    @charities = Charity.order(:created_at).all
  end

  def show
  end

  def new
    @charity = Charity.new
  end

  def create
    params = charity_params.merge(total: 0, currency: "THB")
    @charity = Charity.new(params)
    @charity.save

    if @charity.persisted?
      flash.notice = t(".success")
      redirect_to admin_charities_path
    else
      flash.alert = t(".failure")
      render :new
    end
  end

  def destroy
    @charity.destroy
    flash[:danger] = "Charity was successfully deleted"
    redirect_to admin_charities_path
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :description)
  end

  def set_charity
    @charity = Charity.find(params[:id])
  end
end
