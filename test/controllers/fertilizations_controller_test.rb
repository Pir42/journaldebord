require 'test_helper'

class FertilizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fertilization = fertilizations(:one)
  end

  test "should get index" do
    get fertilizations_url
    assert_response :success
  end

  test "should get new" do
    get new_fertilization_url
    assert_response :success
  end

  test "should create fertilization" do
    assert_difference('Fertilization.count') do
      post fertilizations_url, params: { fertilization: { date: @fertilization.date, fertilizer_id: @fertilization.fertilizer_id, parcel_id: @fertilization.parcel_id, quantity: @fertilization.quantity, user_id: @fertilization.user_id } }
    end

    assert_redirected_to fertilization_url(Fertilization.last)
  end

  test "should show fertilization" do
    get fertilization_url(@fertilization)
    assert_response :success
  end

  test "should get edit" do
    get edit_fertilization_url(@fertilization)
    assert_response :success
  end

  test "should update fertilization" do
    patch fertilization_url(@fertilization), params: { fertilization: { date: @fertilization.date, fertilizer_id: @fertilization.fertilizer_id, parcel_id: @fertilization.parcel_id, quantity: @fertilization.quantity, user_id: @fertilization.user_id } }
    assert_redirected_to fertilization_url(@fertilization)
  end

  test "should destroy fertilization" do
    assert_difference('Fertilization.count', -1) do
      delete fertilization_url(@fertilization)
    end

    assert_redirected_to fertilizations_url
  end
end
