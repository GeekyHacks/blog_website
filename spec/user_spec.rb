require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'name', photo: 'photo url', bio: 'this is the bio') }
  before { subject.save }
  context 'testing the user data entered ' do
    it 'validates that name should not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'validates that photo url should not be blank' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end
    it 'validates that bio should not be blank' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end
  end
  context 'testing the postcounter' do
    it 'validates that postcounter is not blank' do
      subject.postcounter = nil
      expect(subject).to_not be_valid
    end
    it 'validates that postcounter is greater or equal to zero' do
      subject.postcounter = -1
      expect(subject).to_not be_valid
    end
  end
end
