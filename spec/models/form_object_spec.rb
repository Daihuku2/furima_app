require 'rails_helper'

RSpec.describe FormObject, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @order = FactoryBot.build(:form_object)
    end

    it "全て正しければ登録できること" do
      expect(@order).to be_valid
    end

    it "建物名が空でも登録できること" do
      @order.building_name = nil
      expect(@order).to be_valid
    end

    it "postal_codeが空では登録できないこと" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeにハイフンが含まれなければ登録できないこと" do
      @order.postal_code = 1234567
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end

    it "prefecture_idが空では登録できないこと" do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "cityが空では登録できないこと" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it "addressが空では登録できないこと" do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが文字では登録できないこと" do
      @order.phone_number = "ろろろたまは"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is not a number")
    end

    it "phone_numberが12文字以上では登録できないこと" do
      @order.phone_number = "173205080757"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is not a number")
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
