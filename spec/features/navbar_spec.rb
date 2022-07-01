require 'rails_helper'

RSpec.describe 'Navbar', type: :feature do
  before :all do
    Entity.all.destroy_all
    Category.all.destroy_all
    User.all.destroy_all
    @first_user = User.create(
      name: 'Test',
      email: 't@t.com',
      password: '123456'
    )
    @category = Category.create(user: @first_user, name: 'testing')
    @transaction = Entity.create(user: @first_user, category: @category, name: 'test transaction', amount: 1)
  end

  after :all do
    @transaction.destroy
    @category.destroy
    @first_user.destroy
  end

  before :each do
    visit root_path
    click_button 'LOG IN'
    fill_in 'user_email', with: 't@t.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
  end

  it 'Should log out correctly' do
    click_button(class: 'hamburger-button')
    click_link('Log out')
    expect(current_path).to be == root_path
  end
end
