require 'test_helper'

class EventitemsControllerTest < ActionController::TestCase
  setup do
    @eventitem = eventitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventitem" do
    assert_difference('Eventitem.count') do
      post :create, :eventitem => { :description => @eventitem.description, :item => @eventitem.item }
    end

    assert_redirected_to eventitem_path(assigns(:eventitem))
  end

  test "should show eventitem" do
    get :show, :id => @eventitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @eventitem
    assert_response :success
  end

  test "should update eventitem" do
    put :update, :id => @eventitem, :eventitem => { :description => @eventitem.description, :item => @eventitem.item }
    assert_redirected_to eventitem_path(assigns(:eventitem))
  end

  test "should destroy eventitem" do
    assert_difference('Eventitem.count', -1) do
      delete :destroy, :id => @eventitem
    end

    assert_redirected_to eventitems_path
  end
end
