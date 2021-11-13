require 'spec_helper'

module Features
  module SessionHelpers
    def login_user
      user = FactoryBot.create(:user_with_posts)
      user.confirm
      sign_in user
    end
  end
end
