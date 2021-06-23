require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe  '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1 #FactoryBot.createが２つ以上ある場合に使用する。＊バグ防止のため
      @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_order).to be_valid
      end
      it '建物名が空でも保存できる' do
        @purchase_order.suburb = ''
        expect(@purchase_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空の場合、保存ができない' do
        @purchase_order.postal_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でない空合、保存ができない' do
        @purchase_order.postal_code = 1234567
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空の場合、保存ができない' do
        @purchase_order.state_id = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("State can't be blank")
      end
      it '市区町村が空の場合、保存ができない' do
        @purchase_order.city = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空の場合、保存ができない' do
        @purchase_order.street_address = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空の場合、保存ができない' do
        @purchase_order.phone_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上の場合、保存ができない' do
        @purchase_order.phone_number = '090123456789'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
