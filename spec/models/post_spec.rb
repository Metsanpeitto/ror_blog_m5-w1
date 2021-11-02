require 'rails_helper'
require_relative '../../app/models/user'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  subject do
    described_class.new(user_id: :user, title: 'The post-test', text: 'Alkdfgjdklfgasdasdasdasd', likes_counter: 1,
                        comments_counter: 1)
  end
  it { should belong_to(:user).without_validating_presence }

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a likes_counter' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a comments_counter' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid with a likes_counter equals to 0' do
    subject.likes_counter = 0
    expect(subject).to_not be_valid
  end
  it 'is not valid with a comments_counter equals to 0' do
    subject.comments_counter = 0
    expect(subject).to_not be_valid
  end
  it 'method most_recent returns comments' do
    expect(described_class.most_recent(1)).to be_truthy
  end
end
