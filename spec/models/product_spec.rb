require 'rails_helper'

RSpec.describe Product, type: :model do
   describe 'Validations' do
    it 'is valid with valid attributes' do
      @category = Category.new
      @product = Product.new(name: 'Test product', price: 100, quantity: 10, category: @category)
      expect(@product).to be_valid
    end
  end
end
