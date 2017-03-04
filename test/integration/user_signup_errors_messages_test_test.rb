require 'test_helper'

class UserSignupErrorsMessagesTestTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "users have signup messages errors" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path,params: {user: {name:"",
        email:"masmas@invalid",
        password:"",
        password_confirmation:""
        }}
      end
      assert_template 'users/new'
      assert_select "li"
    end
  end
