class ItemsController < ApplicationController
    before_action :authenticate_user!, only:[:new]

    def index
        @items = Item.all.order("created_at DESC")
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.valid?
            @item.save
            return redirect_to root_path
        end
        render 'new'
    end

    private
    def item_params
        params.require(:item).permit(
            :image,
            :comments,
            :name,
            :price,
            :category_id,
            :status_id,
            :burden_id,
            :area_id,
            :delivery_id
        ).merge(user_id: current_user.id)
    end
end
