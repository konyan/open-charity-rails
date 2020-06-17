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
    @charity = @app.create_charity(charity_params)

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
