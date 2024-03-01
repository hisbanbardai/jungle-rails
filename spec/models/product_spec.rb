require 'rails_helper'

RSpec.describe Product, type: :model do
   describe 'Validations' do
    it 'is valid with valid attributes' do
      @category = Category.new
      @product = Product.new(name: 'Test product', price: 100, quantity: 10, category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.new
      @product = Product.new(price: 100, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end
  end
end
