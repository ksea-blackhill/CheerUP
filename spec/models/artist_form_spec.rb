require 'rails_helper'

RSpec.describe ArtistForm, type: :model do
  before do
    @artist_form = FactoryBot.build(:artist_form)
  end

  describe '支援機能' do
    context '支援機能がうまくいく時' do
      it '入力項目が全て存在すれば登録できる' do
        expect(@artist_form).to be_valid
      end
    end

    context '支援機能がうまくいかない時' do
      it 'tokenが空だと登録できない' do
        @artist_form.token = nil
        @artist_form.valid?
        expect(@artist_form.errors.full_messages).to include("Token can't be blank") 
      end
      it 'priceが空だと登録できない' do
        @artist_form.price = ''
        @artist_form.valid?
        expect(@artist_form.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数字以外だと登録できない' do
        @artist_form.price = 'sample'
        @artist_form.valid?
        expect(@artist_form.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが500以下だと登録できない' do
        @artist_form.price = 200
        @artist_form.valid?
        expect(@artist_form.errors.full_messages).to include("Price must be greater than or equal to 500")
      end
      it 'priceが1,000,000以上だと登録できない' do
        @artist_form.price = 1100000
        @artist_form.valid?
        expect(@artist_form.errors.full_messages).to include("Price must be less than or equal to 1000000")
      end
      it 'commentが空だと登録できない' do
        @artist_form.comment = ''
        @artist_form.valid?
        expect(@artist_form.errors.full_messages).to include("Comment can't be blank")
      end
      it 'commentが20文字以下だと登録できない' do
        @artist_form.comment = 'sample'
        @artist_form.valid?
        expect(@artist_form.errors.full_messages).to include("Comment is too short (minimum is 20 characters)")
      end
    end
  end
end