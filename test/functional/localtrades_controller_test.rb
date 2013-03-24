require 'test_helper'

class LocaltradesControllerTest < ActionController::TestCase
  setup do
    @localtrade = localtrades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:localtrades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create localtrade" do
    assert_difference('Localtrade.count') do
      post :create, localtrade: { broker: @localtrade.broker, buy: @localtrade.buy, content_type: @localtrade.content_type, price: @localtrade.price, settlement_period: @localtrade.settlement_period, trader: @localtrade.trader, volume: @localtrade.volume }
    end

    assert_redirected_to localtrade_path(assigns(:localtrade))
  end

  test "should show localtrade" do
    get :show, id: @localtrade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @localtrade
    assert_response :success
  end

  test "should update localtrade" do
    put :update, id: @localtrade, localtrade: { broker: @localtrade.broker, buy: @localtrade.buy, content_type: @localtrade.content_type, price: @localtrade.price, settlement_period: @localtrade.settlement_period, trader: @localtrade.trader, volume: @localtrade.volume }
    assert_redirected_to localtrade_path(assigns(:localtrade))
  end

  test "should destroy localtrade" do
    assert_difference('Localtrade.count', -1) do
      delete :destroy, id: @localtrade
    end

    assert_redirected_to localtrades_path
  end
end
