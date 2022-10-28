require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'adio', email: 'admin@exampl23e.com', password: '123456t')
  end

  before { subject.save }

  it 'name should be present' do
    @user.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be blank' do
    @user.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should not exceed 25 characters' do
    @user.name = 'Lorem Ipsumsimply dummydolor sit'
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    @user.email = nil
    expect(subject).to_not be_valid
  end

  it 'email should not be blank' do
    @user.email = ''
    expect(subject).to_not be_valid
  end
end
