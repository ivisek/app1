require 'test_helper'

class CardNumbersControllerTest < ActionController::TestCase
  setup do
    @card_number = card_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_number" do
    assert_difference('CardNumber.count') do
      post :create, card_number: @card_number.attributes
    end

    assert_redirected_to card_number_path(assigns(:card_number))
  end

  test "should show card_number" do
    get :show, id: @card_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_number
    assert_response :success
  end

  test "should update card_number" do
    put :update, id: @card_number, card_number: @card_number.attributes
    assert_redirected_to card_number_path(assigns(:card_number))
  end

  test "should destroy card_number" do
    assert_difference('CardNumber.count', -1) do
      delete :destroy, id: @card_number
    end

    assert_redirected_to card_numbers_path
  end
end
