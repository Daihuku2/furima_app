require 'rails_helper'

RSpec.describe Item, type: :model do
    describe '#create' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.build(:item)
      end

      it "commentsとname、priceと各種idが存在すれば登録できること" do
        expect(@item).to be_valid
      end

      it "imageが空では登録できないこと" do

        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
  
      it "説明文が空では登録できないこと" do
        @item.comments = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Comments can't be blank")
      end

      it "商品名が空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "価格が空では登録できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が299では登録できないこと" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it "価格が全角数字では登録できないこと" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "category_idが1では登録できないこと" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "status_idが1では登録できないこと" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "burden_idが1では登録できないこと" do
        @item.burden_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it "area_idが1では登録できないこと" do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it "delivery_idが1では登録できないこと" do
        @item.delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end
    end
end