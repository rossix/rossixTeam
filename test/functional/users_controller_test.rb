require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => { :crypted_password => @user.crypted_password, :email => @user.email, :firstname => @user.firstname, :group_id => @user.group_id, :login => @user.login, :name => @user.name, :remember_token => @user.remember_token, :remember_token_expires_at => @user.remember_token_expires_at, :salt => @user.salt, :telnr_string => @user.telnr_string }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user
    assert_response :success
  end

  test "should update user" do
    put :update, :id => @user, :user => { :crypted_password => @user.crypted_password, :email => @user.email, :firstname => @user.firstname, :group_id => @user.group_id, :login => @user.login, :name => @user.name, :remember_token => @user.remember_token, :remember_token_expires_at => @user.remember_token_expires_at, :salt => @user.salt, :telnr_string => @user.telnr_string }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user
    end

    assert_redirected_to users_path
  end
end
