require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'adio', email: 'adio@email.com', password: '123456t')
    @category = Group.new(name: 'Food', user_id: @user.id,
                          icon: Rack::Test::UploadedFile.new('spec/support/test_image.jpg'))
  end

  before { subject.save }

  it 'name must not be blank.' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'Icon unit must not be blank.' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end
end
