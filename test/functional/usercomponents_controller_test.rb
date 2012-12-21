require 'test_helper'

class UsercomponentsControllerTest < ActionController::TestCase
  setup do
    @usercomponent = usercomponents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usercomponents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usercomponent" do
    assert_difference('Usercomponent.count') do
      post :create, usercomponent: @usercomponent.attributes
    end

    assert_redirected_to usercomponent_path(assigns(:usercomponent))
  end

  test "should show usercomponent" do
    get :show, id: @usercomponent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usercomponent
    assert_response :success
  end

  test "should update usercomponent" do
    put :update, id: @usercomponent, usercomponent: @usercomponent.attributes
    assert_redirected_to usercomponent_path(assigns(:usercomponent))
  end

  test "should destroy usercomponent" do
    assert_difference('Usercomponent.count', -1) do
      delete :destroy, id: @usercomponent
    end

    assert_redirected_to usercomponents_path
  end
end
