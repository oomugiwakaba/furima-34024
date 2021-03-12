class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end


  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:iname, :description, :price, :image, :category_id, :day_id, :delivery_id, :prefectures_id, :status_id).merge(user_id: current_user.id)
  end

end
