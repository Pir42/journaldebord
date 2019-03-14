require "application_system_test_case"

class DirectoriesTest < ApplicationSystemTestCase
  setup do
    @directory = directories(:one)
  end

  test "visiting the index" do
    visit directories_url
    assert_selector "h1", text: "Directories"
  end

  test "creating a Directory" do
    visit directories_url
    click_on "New Directory"

    fill_in "Address", with: @directory.address
    fill_in "City", with: @directory.city
    fill_in "Comment", with: @directory.comment
    fill_in "Contract", with: @directory.contract
    fill_in "First name", with: @directory.first_name
    fill_in "Last name", with: @directory.last_name
    fill_in "Phone", with: @directory.phone
    fill_in "Postcode", with: @directory.postcode
    click_on "Create Directory"

    assert_text "Directory was successfully created"
    click_on "Back"
  end

  test "updating a Directory" do
    visit directories_url
    click_on "Edit", match: :first

    fill_in "Address", with: @directory.address
    fill_in "City", with: @directory.city
    fill_in "Comment", with: @directory.comment
    fill_in "Contract", with: @directory.contract
    fill_in "First name", with: @directory.first_name
    fill_in "Last name", with: @directory.last_name
    fill_in "Phone", with: @directory.phone
    fill_in "Postcode", with: @directory.postcode
    click_on "Update Directory"

    assert_text "Directory was successfully updated"
    click_on "Back"
  end

  test "destroying a Directory" do
    visit directories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Directory was successfully destroyed"
  end
end
