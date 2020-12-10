class OrdersController < ApplicationController
  before_action :select_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @form = FormObject.new
    if current_user.id == @item.user_id || unless item.order == nil
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

  def pay_item
    Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
    end
  end
end
