require 'rails_helper'
RSpec.describe 'groups/index', type: :feature do
  before :each do
    @user = User.create(name: 'user1', email: "#{DateTime.now.to_i}@gmail.com", password: 'password',
                        password_confirmation: 'password')

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe "Visit groups' index page" do
    it 'should have button to create new category' do
      visit(groups_path)
      expect(page).to have_text('ADD NEW CATEGORY')
    end

    it 'should have title in the head' do
      visit(groups_path)
      expect(page).to have_text('Category')
    end

    it 'should have group icon' do
      visit(new_group_path)
      expect(page).to have_text('Icon')
    end

    it 'should create a grup' do
      visit(new_group_path)
      fill_in 'Name', with: 'Food'
      attach_file('group_icon', 'spec/support/test_image.jpg')
      click_button 'Save'
      expect(page).to have_text('Category was successfully created.')
    end

    it 'should have save button' do
      visit(new_group_path)
      expect(page).to have_selector(:link_or_button, 'Save', exact: true)
    end

    it 'should have new page link' do
      visit(new_group_path)
      expect(page).to have_selector(:link_or_button, exact: true)
    end

    it 'redirect to add new group' do
      visit(new_group_path)
      click_button('Save', exact: true)
      expect(page).to have_current_path(groups_path)
    end
  end
end
