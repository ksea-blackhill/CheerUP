require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it '入力必須項目が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまく行かない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'eamilに@が入っていなければ登録できない' do
        @user.email = 'abcdefg.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailに一意性がなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数字混合でないと登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英文字だけだと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが入力されていてもpassword confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'ﾌﾞﾗｯｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'ﾋﾙ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'kana_firstが空だと登録できない' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it 'kana_firstが半角だと登録できない' do
        @user.kana_first = 'ﾌﾞﾗｯｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid")
      end
      it 'kana_firstがカタカナ以外だと登録できない' do
        @user.kana_first = '高山'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid")
      end
      it 'kana_lastが空だと登録できない' do
        @user.kana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last can't be blank")
      end
      it 'kana_lastが半角だと登録できない' do
        @user.kana_last = 'ﾋﾙ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last is invalid")
      end
      it 'kana_lastがカタカナ以外だと登録できない' do
        @user.kana_last = '明男'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last is invalid")
      end
      it 'age_idが -- のままだと登録できない' do
        @user.age_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Age must be other than 1")
      end
      it 'prefecture_idが -- のままだと登録できない' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'gender_idが -- のままだと登録できない' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender must be other than 1")
      end
    end
  end
end
