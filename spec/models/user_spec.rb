require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "すべての項目が正しく入力できれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "登録済みのemailと重複するものは登録できない" do
      end
      it "@を含まないemailは登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordは6文字以上でないと登録できない" do
      end
      it "passwordは半角英数字混合でないと登録できない" do
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "first_nameが空では登録できない" do
      end
      it "last_nameは漢字、ひらがな、カタカナ以外では登録できない" do
      end
      it "first_nameは漢字、ひらがな、カタカナ以外では登録できない" do
      end
      it "last_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaが空では登録できない" do
      end
      it "last_name_kanaはカタカナ以外では登録できない" do
      end
      it "first_name_kanaはカタカナ以外では登録できない" do
      end
      it " birthdayが空では登録できない" do
      end
    end
  end

end
