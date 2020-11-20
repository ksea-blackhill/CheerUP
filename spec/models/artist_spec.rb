require 'rails_helper'

describe Artist do
  before do
    @artist = FactoryBot.build(:artist)
    @artist.image = fixture_file_upload('/files/image.png')
    @artist.video = fixture_file_upload('/files/for_test.MOV')
  end

  describe 'アーティスト情報新規投稿' do
    context '新規投稿がうまく行く時' do
      it '入力項目が全て存在すれば登録できる' do
        expect(@artist).to be_valid
      end
      it 'sub_genre_idが -- でも登録できる' do
        @artist.sub_genre_id = 1
        expect(@artist).to be_valid
      end
      it 'urlが空でも登録できる' do
        @artist.url = ''
        expect(@artist).to be_valid
      end
    end

    context '新規投稿がうまく行かない時' do
      it 'imageが空だと登録できない' do
        @artist.image = nil
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Image can't be blank")
      end
      it 'imageが動画だと投稿できない' do
        
      end
      it 'nameが空だと登録できない' do
        @artist.name = ''
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @artist.description = ''
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Description can't be blank")
      end
      it 'descriptionが20文字以下だと登録できない' do
        @artist.description = 'Sample'
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Description is too short (minimum is 20 characters)")
      end
      it 'prefecture_idが -- のままだと登録できない' do
        @artist.prefecture_id = 1
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'genre_idが -- のままだと登録できない' do
        @artist.genre_id = 1
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Genre must be other than 1")
      end
      it 'artist_gender_idが -- のままだと登録できない' do
        @artist.artist_gender_id = 1
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Artist gender must be other than 1")
      end
      it 'member_idが -- のままだと登録できない' do
        @artist.member_id = 1
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Member must be other than 1")
      end
      it 'socialが空だと登録できない' do
        @artist.social = ''
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Social can't be blank")
      end
      it 'socialが正しいURLでない場合登録できない' do
        @artist.social = 'httt//12345678.com'
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Social is not a valid URL")
      end
      it 'videoが空だと登録できない' do
        @artist.video = nil
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Video can't be blank")
      end
      it 'urlが正しいURLでない場合登録できない' do
        @artist.url = 'httt//12345678.com'
        @artist.valid?
        expect(@artist.errors.full_messages).to include("Url is not a valid URL")
      end
    end
  end
end
