require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'すべての項目が正しく入力できれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '登録済みのemailと重複するものは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it '@を含まないemailは登録できない' do
        @user.email = 'abcdefg.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordは5文字以下では登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英字と半角数字の両方を含めて設定してください')
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英字と半角数字の両方を含めて設定してください')
      end
      it 'passwordは全角では登録できない' do
        @user.password = '１２３４５ｄ'
        @user.password_confirmation = '１２３４５ｄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英字と半角数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（苗字）を入力してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（なまえ）を入力してください')
      end
      it 'last_nameは漢字、ひらがな、カタカナ以外では登録できない' do
        @user.last_name = 'a1ｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（苗字）全角文字を使用してください')
      end
      it 'first_nameは漢字、ひらがな、カタカナ以外では登録できない' do
        @user.first_name = 'a1ｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（なまえ）全角文字を使用してください')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（苗字カナ）を入力してください')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（なまえカナ）を入力してください')
      end
      it 'last_name_kanaはカタカナ以外では登録できない' do
        @user.last_name_kana = 'aあ1亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（苗字カナ）全角カタカナを使用してください')
      end
      it 'first_name_kanaはカタカナ以外では登録できない' do
        @user.first_name_kana = 'aあ1亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（なまえカナ）全角カタカナを使用してください')
      end
      it ' birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
