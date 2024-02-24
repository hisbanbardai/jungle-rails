class Admin::SalesController < ApplicationController

  def index
  #  if no render statement is present then render :index is implied
    @sales = Sale.all
  end
end
