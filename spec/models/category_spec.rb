require 'rails_helper'

RSpec.describe Category, type: :model do
  before :all do
    @user = User.new(name: 'Test', email: 'test@test', password: '123456')
    @category = Category.new(user: @user, name: 'testing')
  end

  it 'Saves new category' do
    category = Category.new(user: @user, name: 'testing')
    expect(category).to be_valid
  end

  it 'Be invalid due to wrong name' do
    category = Category.new(user: @user, name: '')
    expect(category).to be_invalid
  end
end
