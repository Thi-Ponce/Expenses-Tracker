require 'rails_helper'

RSpec.describe 'Transactions pages', type: :feature do
  before :all do
    @first_user = User.create(
      name: 'Test',
      email: 't@t.com',
      password: '123456'
    )
    @category = Category.create(user: @first_user, name: 'testing')
    @transaction = Entity.create(user: @first_user, category: @category, name: 'test transaction', amount: 1)
  end

  before :each do
    visit root_path
    click_button 'LOG IN'
    fill_in 'user_email', with: 't@t.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    click_link(@category.name)
  end

  after :all do
    @transaction.destroy
    @category.destroy
    @first_user.destroy
  end

  it 'Page must have correct title' do
    expect(page).to have_content('Transactions')
  end

  it 'Navigate to add transaction page' do
    click_button('Add Transaction')
    expect(current_path).to be == entity_new_path(category_id: @category.id)
  end

  it 'Save a new Transaction' do
    click_button('Add Transaction')
    fill_in 'entity_name', with: 'test transaction 2'
    fill_in 'entity_amount', with: '1'
    click_button('Create')
    expect(Entity.last.name).to be == 'test transaction 2'
    Entity.last.destroy
  end
end
