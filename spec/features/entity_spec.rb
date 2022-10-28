require 'rails_helper'
RSpec.describe Entity, type: :feature do
  before :each do
    @user = User.create(name: 'user1', email: "#{DateTime.now.to_i}@gmail.com", password: 'password',
                        password_confirmation: 'password')
    @group = Group.create(name: 'Food', user_id: @user.id,
                          icon: Rack::Test::UploadedFile.new('spec/support/test_image.jpg'))

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe "Visit groups' index page" do
    it 'should have created category name' do
      visit(groups_path)
      expect(page).to have_text('Food')
    end

    it 'Category title should link to transaction page' do
      visit(groups_path)
      click_link 'Food'
      expect(page).to have_current_path(group_path(@group))
      expect(page).to have_text('Transactions')
    end

    it 'should have a button to add new transaction' do
      visit(group_path(@group))
      expect(page).to have_text('Add a new transaction')
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
