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

  it 'is not valid without a password' do
     @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '',
      password_confirmation: '12345'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages.first).to eq "Password can't be blank"
  end

  it 'is not valid without a password confirmation' do
     @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: nil
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages.first).to eq "Password confirmation can't be blank"
  end

  it 'is not valid when password and password_confirmation fields do not match' do
     @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '1234'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages.first).to eq "Password confirmation doesn't match Password"
  end
end
