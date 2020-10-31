ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper
  include SessionsHelper

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest

  # テストユーザーとしてログインする
  def log_in(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end

class Rack::Test::CookieJar
  def signed
    self
  end
end
