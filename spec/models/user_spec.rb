require 'rails_helper'

describe User do
  it 'will have a name' do
    user = FactoryGirl.create(:user)
    expect(user.name).to eq 'Sock monkey'
  end
  it 'will have a username' do
    user = FactoryGirl.create(:user)
    expect(user.username).to eq 'funkMonkey'
  end
  it 'will have email' do
    user = FactoryGirl.create(:user)
    expect(user.email).to eq 'a@b.com'
  end
  it 'will have a password' do
    user = FactoryGirl.create(:user)
    expect(user.password).to eq '12'
  end
  it { should have_many :images}
end
