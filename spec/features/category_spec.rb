require 'rails_helper'

RSpec.describe 'Category pages', type: :feature do
  before :all do
    @first_user = User.create(
      name: 'Test',
      email: 't@t.com',
      password: '123456'
    )
    @category = Category.create(user: @first_user, name: 'testing')
  end

  before :each do
    visit root_path
    click_button 'LOG IN'
    fill_in 'user_email', with: 't@t.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
  end

  after :all do
    @category.destroy
    @first_user.destroy
  end

  it 'Home page must have title' do
    expect(page).to have_content('Categories')
  end

  it 'Categories must have the testing category' do
    path = "//div[@data-id=\"category-#{@category.id}\"]"
    expect(page.has_xpath?(path, count: 1) &&
           page.has_content?(@category.name)).to be true
  end

  it 'Navigate to correct transaction page' do
    click_link(@category.name)
    expect(current_path).to be == entity_index_path
    expect(page).to have_content('Transactions')
  end

  it 'Navigate to add category page' do
    click_button('Add Category')
    expect(current_path).to be == categories_new_path
  end

  it 'Save a new Category' do
    click_button('Add Category')
    fill_in 'category_name', with: 'testing2'
    click_button('Create')
    expect(Category.last.name).to be == 'testing2'
    Category.last.destroy
  end
end
