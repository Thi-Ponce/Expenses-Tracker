require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before :all do
    @first_user ||= User.create(
      name: 'Test',
      email: 't@t.com',
      password: '123456'
    )
  end

  before :each do
    visit root_path
    click_button 'LOG IN'
  end

  after :all do
    @first_user.destroy
  end

  it 'Load in form correctly' do
    expect(has_field?('user_email') && has_field?('user_password') && has_button?('Log in')).to be true
  end

  it 'Give out an error with empty fields' do
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Give out an error with wrong data' do
    fill_in 'user_email', with: 'a@a.com'
    fill_in 'user_password', with: '654321'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Redirect to home page when correctly filled out' do
    fill_in 'user_email', with: 't@t.com'
    fill_in 'user_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_current_path(categories_index_path)
  end
end
