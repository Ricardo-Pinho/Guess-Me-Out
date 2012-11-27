require 'test_helper'

class AvatarcomponentsControllerTest < ActionController::TestCase
  setup do
    @avatarcomponent = avatarcomponents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:avatarcomponents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create avatarcomponent" do
    assert_difference('Avatarcomponent.count') do
      post :create, avatarcomponent: @avatarcomponent.attributes
    end

    assert_redirected_to avatarcomponent_path(assigns(:avatarcomponent))
  end

  test "should show avatarcomponent" do
    get :show, id: @avatarcomponent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @avatarcomponent
    assert_response :success
  end

  test "should update avatarcomponent" do
    put :update, id: @avatarcomponent, avatarcomponent: @avatarcomponent.attributes
    assert_redirected_to avatarcomponent_path(assigns(:avatarcomponent))
  end

  test "should destroy avatarcomponent" do
    assert_difference('Avatarcomponent.count', -1) do
      delete :destroy, id: @avatarcomponent
    end

    assert_redirected_to avatarcomponents_path
  end
end
