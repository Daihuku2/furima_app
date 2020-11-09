require 'rails_helper'

RSpec.describe User, type: :model do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end
  
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "nicknameが空では登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "同じメールアドレスでは登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "@を含まないメールアドレスは登録できないこと" do
        @user.email = "aaahome.ne.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "確認用passwordが空では登録できないこと" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードが半角英字のみでは登録できないこと" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードが数字のみでは登録できないこと" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードに大文字が含まれていたら登録できないこと" do
        @user.password = "Aaaaaa"
        @user.password_confirmation = "Aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "family_name_kanjiが空では登録できないこと" do
        @user.family_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "first_name_kanjiが空では登録できないこと" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "family_name_kanjiが英字では登録できないこと" do
        @user.family_name_kanji = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "first_name_kanjiが英字では登録できないこと" do
        @user.first_name_kanji = "makoto"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "family_name_kanaが空では登録できないこと" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "first_name_kanaが空では登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "family_name_kanaが漢字では登録できないこと" do
        @user.family_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "first_name_kanaが漢字では登録できないこと" do
        @user.nickname = "誠"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      
    end
end