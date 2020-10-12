require 'rails_helper'

RSpec.describe Pianist, type: :model do
  describe '伴奏者情報の保存' do
    before do
      @pianist = FactoryBot.build(:pianist)
   end

   context '伴奏者登録がうまくいくとき' do
   it 'すべての値が正しく入力されていれば保存できること' do
    expect(@pianist).to be_valid
   end
   it 'messageが空でも保存できること' do
    @pianist.message = nil
      expect(@pianist).to be_valid
   end
   it 'videoが空でも保存できること' do
    @pianist.video = nil
      expect(@pianist).to be_valid
   end
  end

  context '伴奏者登録がうまくいかないとき' do
   it 'imageが空だと保存できないこと' do
    @pianist.image = nil
    @pianist.valid?
    expect(@pianist.errors.full_messages).to include("画像を入力してください")
   end
   it 'schoolが空だと保存できないこと' do
    @pianist.school = nil
    @pianist.valid?
    expect(@pianist.errors.full_messages).to include("学歴を入力してください")
   end
   it 'repertが空だと保存できないこと' do
    @pianist.repert = nil
    @pianist.valid?
    expect(@pianist.errors.full_messages).to include("レパートリーを入力してください")
   end
   it 'areaが空だと保存できないこと' do
    @pianist.area = nil
    @pianist.valid?
    expect(@pianist.errors.full_messages).to include("活動地域を入力してください")
   end
   it 'moneyが空だと保存できないこと' do
    @pianist.money = nil
    @pianist.valid?
    expect(@pianist.errors.full_messages).to include("伴奏依頼金を入力してください")
   end
  end
end
end