# FooterYearUpdate SDK exists test

require "minitest/autorun"
require_relative "../FooterYearUpdate_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = FooterYearUpdateSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
