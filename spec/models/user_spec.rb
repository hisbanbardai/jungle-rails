require 'rails_helper'

RSpec.describe User, type: :model do
  it 'successfully creates a new user when all valid fields are entered' do
    @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    )
    expect(@user).to be_valid
  end
end
