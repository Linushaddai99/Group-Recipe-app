require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name:"Mert", email: 'mert@gmail.com', password: '12345678')
  end
  before { subject.save }

  it 'name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should not be empty' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'name should be implemented' do
    expect(subject.name).to eql "Mert"
  end

  it 'email should be implemenged' do
    expect(subject.email).to eql 'mert@gmail.com'
  end



  


end
