require 'test_helper'

class BloggersControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get bloggers_name_url
    assert_response :success
  end

  test "should get age:integer" do
    get bloggers_age:integer_url
    assert_response :success
  end

  test "should get bio:text" do
    get bloggers_bio:text_url
    assert_response :success
  end

end
