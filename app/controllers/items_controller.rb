class ItemsController < ApplicationController
    before_action :authenticate_user!, only:[:new]

    def index
        @items = Item.all.order("created_at DESC")
    end

    def show
        @item = Item.find(params[:id])
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

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to root_path
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
