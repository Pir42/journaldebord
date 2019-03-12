require "application_system_test_case"

class FertilizationsTest < ApplicationSystemTestCase
  setup do
    @fertilization = fertilizations(:one)
  end

  test "visiting the index" do
    visit fertilizations_url
    assert_selector "h1", text: "Fertilizations"
  end

  test "creating a Fertilization" do
    visit fertilizations_url
    click_on "New Fertilization"

    fill_in "Date", with: @fertilization.date
    fill_in "Fertilizer", with: @fertilization.fertilizer_id
    fill_in "Parcel", with: @fertilization.parcel_id
    fill_in "Quantity", with: @fertilization.quantity
    fill_in "User", with: @fertilization.user_id
    click_on "Create Fertilization"

    assert_text "Fertilization was successfully created"
    click_on "Back"
  end

  test "updating a Fertilization" do
    visit fertilizations_url
    click_on "Edit", match: :first

    fill_in "Date", with: @fertilization.date
    fill_in "Fertilizer", with: @fertilization.fertilizer_id
    fill_in "Parcel", with: @fertilization.parcel_id
    fill_in "Quantity", with: @fertilization.quantity
    fill_in "User", with: @fertilization.user_id
    click_on "Update Fertilization"

    assert_text "Fertilization was successfully updated"
    click_on "Back"
  end

  test "destroying a Fertilization" do
    visit fertilizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fertilization was successfully destroyed"
  end
end
