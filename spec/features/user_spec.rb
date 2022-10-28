require 'rails_helper'

RSpec.describe 'Index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'user1', email: "#{DateTime.now}@gmail.com",
                        password: 'password',
                        password_confirmation: 'password')
  end

  describe 'index page' do
    it 'shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end

    it 'should have the right content' do
      visit new_user_session_path
      expect(page).to have_content('Remember me')
    end
  end
end
