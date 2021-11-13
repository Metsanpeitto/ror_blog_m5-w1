require 'rails_helper'
require_relative '../../app/models/post'

RSpec.describe User, type: :model do
  # subject do
  #  described_class.new(name: 'Juan',
  #                      photo: 'https://imgur.9823432/',
  #                      bio: 'Lots of things to say in here',
  #                      post_counter: 1)
  # end

  let(:user) { FactoryBot.create(:user_with_posts) }

  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end
  subject do
    user
  end

  describe 'GET #index' do
    it { should have_many(:posts).without_validating_presence }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a photo' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a post_counter' do
      subject.post_counter = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with a post_counter equals to 0' do
      subject.post_counter = 0
      expect(subject).to_not be_valid
    end
  end
end
