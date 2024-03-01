require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    it 'successfully creates a new user when all valid fields are entered' do
    @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    )
    expect(@user).to be_valid
    end

    it 'is not valid without a name' do
     @user = User.new(
      name: nil,
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'is not valid without an email' do
     @user = User.new(
      name: 'Hisban',
      email: nil,
      password: '12345',
      password_confirmation: '12345'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'is not valid without a password' do
     @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '',
      password_confirmation: '12345'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'is not valid without a password confirmation' do
     @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: nil
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'is not valid when password and password_confirmation fields do not match' do
     @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '1234'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'is not valid when email already exists in the database' do
     @user_1 = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    )
    @user_1.save
    expect(@user_1).to be_valid

    @user_2 = User.new(
      name: 'Ali',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    )
    @user_2.save
    expect(@user_2).to_not be_valid

    expect(@user_2.errors.full_messages).to include "Email has already been taken"
    end

    it 'is not valid when an email that already exists in the database is entered with different casing' do
     @user_1 = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
    )
    @user_1.save
    expect(@user_1).to be_valid

    @user_2 = User.new(
      name: 'Ali',
      email: 'TEST@TEST.com',
      password: '12345',
      password_confirmation: '12345'
    )
    @user_2.save
    expect(@user_2).to_not be_valid

    expect(@user_2.errors.full_messages).to include "Email has already been taken"
    end

    it 'is not valid when length of the password is less than 5 characters' do
     @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '1234',
      password_confirmation: '1234'
    )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'authenticates a user successfully when valid credentials are provided' do
      @user = User.new(
      name: 'Hisban',
      email: 'test@test.com',
      password: '123456',
      password_confirmation: '123456'
    )
    @user.save
    expect(@user).to be_valid
    expect(@user.authenticate_with_credentials('test@test.com', '123456')).to_not be nil
    expect(@user.authenticate_with_credentials('test@test.com', '123456')).to eql(@user)
    end
  end
end
