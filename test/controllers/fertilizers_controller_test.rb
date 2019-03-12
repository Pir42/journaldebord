require 'test_helper'

class FertilizersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fertilizer = fertilizers(:one)
  end

  test "should get index" do
    get fertilizers_url
    assert_response :success
  end

  test "should get new" do
    get new_fertilizer_url
    assert_response :success
  end

  test "should create fertilizer" do
    assert_difference('Fertilizer.count') do
      post fertilizers_url, params: { fertilizer: { details: @fertilizer.details, name: @fertilizer.name, nitrogen: @fertilizer.nitrogen, phosphorus: @fertilizer.phosphorus, potassium: @fertilizer.potassium, supplier: @fertilizer.supplier, user_id: @fertilizer.user_id } }
    end

    assert_redirected_to fertilizer_url(Fertilizer.last)
  end

  test "should show fertilizer" do
    get fertilizer_url(@fertilizer)
    assert_response :success
  end

  test "should get edit" do
    get edit_fertilizer_url(@fertilizer)
    assert_response :success
  end

  test "should update fertilizer" do
    patch fertilizer_url(@fertilizer), params: { fertilizer: { details: @fertilizer.details, name: @fertilizer.name, nitrogen: @fertilizer.nitrogen, phosphorus: @fertilizer.phosphorus, potassium: @fertilizer.potassium, supplier: @fertilizer.supplier, user_id: @fertilizer.user_id } }
    assert_redirected_to fertilizer_url(@fertilizer)
  end

  test "should destroy fertilizer" do
    assert_difference('Fertilizer.count', -1) do
      delete fertilizer_url(@fertilizer)
    end

    assert_redirected_to fertilizers_url
  end
end
