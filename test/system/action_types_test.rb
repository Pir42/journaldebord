require "application_system_test_case"

class ActionTypesTest < ApplicationSystemTestCase
  setup do
    @action_type = action_types(:one)
  end

  test "visiting the index" do
    visit action_types_url
    assert_selector "h1", text: "Action Types"
  end

  test "creating a Action type" do
    visit action_types_url
    click_on "New Action Type"

    fill_in "Name", with: @action_type.name
    fill_in "User", with: @action_type.user_id
    click_on "Create Action type"

    assert_text "Action type was successfully created"
    click_on "Back"
  end

  test "updating a Action type" do
    visit action_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @action_type.name
    fill_in "User", with: @action_type.user_id
    click_on "Update Action type"

    assert_text "Action type was successfully updated"
    click_on "Back"
  end

  test "destroying a Action type" do
    visit action_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Action type was successfully destroyed"
  end
end
