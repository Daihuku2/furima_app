class OrdersController < ApplicationController
  before_action :select_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @form = FormObject.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @form = FormObject.new(order_params)
      if @form.valid?
        @form.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def order_params
    params.require(:form_object).permit(
      :postal_code,
      :prefecture_id, 
      :city,          
      :address,      
      :building_name,
      :phone_number,  
      :purchase     
      ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def select_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
