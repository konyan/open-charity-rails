class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @month_total = Transaction.where('extract(month from created_at) = ?', 6).sum("net_amount")
    @month_total_count = Transaction.where('extract(month from created_at) = ?', 6).count
    @all_total = Transaction.all.sum("net_amount")
    @all_total_count = Transaction.all.count
    @today_total = Transaction.where("DATE(created_at) = DATE(?)", Time.now).sum("net_amount")
    @today_total_count =Transaction.where("DATE(created_at) = DATE(?)", Time.now).count

  end

  def show

  end
end