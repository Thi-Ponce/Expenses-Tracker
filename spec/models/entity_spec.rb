require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :all do
    @user = User.new(name: 'Test', email: 'test@test', password: '123456')
    @category = Category.new(user: @user, name: 'testing')
  end

  it 'Save new transaction' do
    transaction = Entity.new(user: @user, category: @category, name: 'transaction1', amount: 10)
    expect(transaction).to be_valid
  end

  it 'Be invalid due to wrong name' do
    transaction = Entity.new(user: @user, category: @category, name: '', amount: 10)
    expect(transaction).to be_invalid
  end

  it 'Be invalid due to wrong amount' do
    transaction = Entity.new(user: @user, category: @category, name: 'transaction1', amount: 0)
    expect(transaction).to be_invalid
  end
end
