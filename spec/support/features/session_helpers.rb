require 'spec_helper'

module Features
  module SessionHelpers
    def login_user
      # @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      user.confirm
      sign_in user
    end
  end
end
