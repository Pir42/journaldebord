require 'test_helper'

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment = treatments(:one)
  end

  test "should get index" do
    get treatments_url
    assert_response :success
  end

  test "should get new" do
    get new_treatment_url
    assert_response :success
  end

  test "should create treatment" do
    assert_difference('Treatment.count') do
      post treatments_url, params: { treatment: { date: @treatment.date, details: @treatment.details, parcel_id: @treatment.parcel_id, quantity: @treatment.quantity, unit: @treatment.unit, user_id: @treatment.user_id, variety_id: @treatment.variety_id } }
    end

    assert_redirected_to treatment_url(Treatment.last)
  end

  test "should show treatment" do
    get treatment_url(@treatment)
    assert_response :success
  end

  test "should get edit" do
    get edit_treatment_url(@treatment)
    assert_response :success
  end

  test "should update treatment" do
    patch treatment_url(@treatment), params: { treatment: { date: @treatment.date, details: @treatment.details, parcel_id: @treatment.parcel_id, quantity: @treatment.quantity, unit: @treatment.unit, user_id: @treatment.user_id, variety_id: @treatment.variety_id } }
    assert_redirected_to treatment_url(@treatment)
  end

  test "should destroy treatment" do
    assert_difference('Treatment.count', -1) do
      delete treatment_url(@treatment)
    end

    assert_redirected_to treatments_url
  end
end
