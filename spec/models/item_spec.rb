require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '保存できる場合' do
      it '販売価格が300以上の場合、保存できる' do
        @item.price = 300
        @item.valid?
        expect(@item).to be_valid
      end

      it '販売価格が9999999以下の場合、保存できる' do
        @item.price = 9_999_999
        @item.valid?
        expect(@item).to be_valid
      end

      it '販売価格が半角数字の場合、保存できる' do
        @item.price = 777
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it '商品画像が無い場合、保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が無い場合、保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'カテゴリー情報がない場合、保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態の情報がない場合、保存できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it '配送料の負担の情報がない場合、保存できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it '発送元の地域の情報がない場合、保存できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it '発送までの日数の情報がない場合、保存できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end

      it '販売価格がない場合、保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が300未満の場合、保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が10000000以上の場合、保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '販売価格が半角数字でない場合、保存できない' do
        @item.price = '７７７'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が半角英数字混合の場合、保存できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が半角英字の場合、保存できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'カテゴリー情報のActiveHashが1の場合、保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品状態の情報のActiveHashが1の場合、保存できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end

      it '配送料の負担の情報のActiveHashが1の場合、保存できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end

      it '発送元の地域の情報のActiveHashが1の場合、保存できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end

      it '発送までの日数の情報のActiveHashが1の場合、保存できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
      end
    end
  end
end
