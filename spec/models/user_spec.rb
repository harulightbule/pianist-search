require 'rails_helper'

#RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
   end

describe 'ユーザー新規登録' do
  context '新規登録がうまくいくとき' do
   it 'すべての値が正しく入力されていれば保存できること' do
    expect(@user).to be_valid
   end
   it 'passwordが6文字以上であれば登録できる' do
    @user.password = "aaa000"
    @user.password_confirmation = "aaa000"
    expect(@user).to be_valid
  end
end

context '新規登録がうまくいかないとき' do
    it 'nameが空だと登録できない' do
    @user.name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it 'emailが空では登録できない' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it '重複したemailが存在する場合登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'passwordが空では登録できない' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "passwordが5文字以下であれば登録できない" do
    @user.password = "00000"
    @user.password_confirmation = "00000"
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
     @user.password_confirmation = nil
     @user.valid?
     expect(@user.errors.full_messages).to include("パスワード（確認用）を入力してください")
    end
  end
 end
end
