require 'rails_helper'
require_relative '../../app/models/post'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Juan',
                        photo: 'https://imgur.9823432/',
                        bio: 'Lots of things to say in here',
                        post_counter: 1)
  end
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

  # describe '.obtain_last_posts' do
  #  before do
  #    @user_posts = described_class.obtain_all_posts(1)
  #    @posts = []
  #    3.times do |i|
  #      next unless i.even?

  #      post = Post.new(user_id: 1, title: "The post-test-#{i}+4", text: 'Alkdfgjdklfgasdasdasdasd')
  #      @posts << post
  #    end
  #  end

  #  it 'scopes the articles in descending order' do
  #    expect(@user_posts).to match_array([@posts])
  #  end
  # end
end
