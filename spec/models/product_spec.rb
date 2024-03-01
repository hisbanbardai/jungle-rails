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
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq "Name can't be blank"
    end

    it 'is not valid without a price' do
      @category = Category.new
      @product = Product.new(name: 'Test product', price_cents: nil, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[2]).to eq "Price can't be blank"
    end

    it 'is not valid without a quantity' do
      @category = Category.new
      @product = Product.new(name: 'Test product', price: 100, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end

    it 'is not valid without a category' do
      @product = Product.new(name: 'Test product', price: 100, quantity: 10, category:nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[1]).to eq "Category can't be blank"
    end
  end
end
