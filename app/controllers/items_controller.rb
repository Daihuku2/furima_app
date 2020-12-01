class ItemsController < ApplicationController
    before_action :authenticate_user!, only:[:new]
    before_action :set_tweet, only: [:edit, :show, :update]
    before_action :move_to_index, only: [:edit]

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
