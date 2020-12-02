class ItemsController < ApplicationController
    before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
    before_action :set_tweet, only: [:edit, :show, :update, :destroy]
    before_action :move_to_index, only: [:edit, :destroy]

    def index
        @items = Item.all.order("created_at DESC")
    end

    def show
    end 

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.valid?
            @item.save
            return redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
      if @item.update(item_params)
        return redirect_to root_path
      else 
        render 'edit'
      end
    end

    def destroy
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

    def set_tweet
        @item = Item.find(params[:id])
    end

    def move_to_index
        unless current_user.id == @item.user_id
          redirect_to action: :index
        end
    end

end
