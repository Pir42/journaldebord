require "application_system_test_case"

class VegetablesTest < ApplicationSystemTestCase
  setup do
    @vegetable = vegetables(:one)
  end

  test "visiting the index" do
    visit vegetables_url
    assert_selector "h1", text: "Vegetables"
  end

  test "creating a Vegetable" do
    visit vegetables_url
    click_on "New Vegetable"

    fill_in "Name", with: @vegetable.name
    fill_in "User", with: @vegetable.user_id
    click_on "Create Vegetable"

    assert_text "Vegetable was successfully created"
    click_on "Back"
  end

  test "updating a Vegetable" do
    visit vegetables_url
    click_on "Edit", match: :first

    fill_in "Name", with: @vegetable.name
    fill_in "User", with: @vegetable.user_id
    click_on "Update Vegetable"

    assert_text "Vegetable was successfully updated"
    click_on "Back"
  end

  test "destroying a Vegetable" do
    visit vegetables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vegetable was successfully destroyed"
  end
end
