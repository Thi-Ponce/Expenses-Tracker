require 'rails_helper'

RSpec.describe 'User model', type: :request do
  it 'Create a valid user' do
    user = User.new(name: 'Test',
                    email: 't@t.com',
                    password: '123456')
    expect(user).to be_valid
  end

  it 'Be invalid due to wrong name' do
    user = User.new(name: '',
                    email: 't@t.com',
                    password: '123456')
    expect(user).to_not be_valid
  end
end
