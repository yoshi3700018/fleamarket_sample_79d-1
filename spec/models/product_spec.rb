require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      product = Product.new(pname: "", explanation: "test", category_id: "1", brand: "1", status: "1", deliver: "1", prefecture: "1", shipping_dates: "1", price: "7777")
      product.valid?
      expect(product.errors[:pname]).to include("can't be blank")
    end
  end
end