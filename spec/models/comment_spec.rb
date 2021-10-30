require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    create(:user, id: 1, name: 'Juan', photo: 'https://imgur.9823432/', bio: 'Lots of things to say in here')
  end
  let(:post) { create(:post, user_id: 1, title: 'The post1', text: 'Alkdfgjdklfgasdasdasdasd') }
  subject do
    described_class.new(user_id: :user, post_id: :post, text: 'Testing stuff in here.')
  end
  it { should belong_to(:user).without_validating_presence }
  it { should belong_to(:post).without_validating_presence }
end
