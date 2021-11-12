require 'spec_helper'

module Features
  module SessionHelpers
    def login_user
      before(:each) do
        @user = FactoryBot.create(:user_with_posts)
        sign_in @user
      end
    end
  end
end
