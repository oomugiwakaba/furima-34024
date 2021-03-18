class BuyAddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect, only: [:index, :create]




  def index
    @buy_address = BuyAddress.new
  end


  def create
    @buy_address = BuyAddress.new(address_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save!
       redirect_to root_path
    else
       render :index
    end
  end



  private

  def address_params
    params.require(:buy_address).permit(:postal, :prefectures_id, :municipality, :adress, :phone, :building).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: address_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def redirect
    redirect_to root_path if current_user.id == @item.user_id || @item.buy.present? 
  end


end
