require "application_system_test_case"

class CampusTest < ApplicationSystemTestCase
  setup do
    @campu = campus(:one)
  end

  test "visiting the index" do
    visit campus_url
    assert_selector "h1", text: "Campus"
  end

  test "creating a Campu" do
    visit campus_url
    click_on "New Campu"

    click_on "Create Campu"

    assert_text "Campu was successfully created"
    click_on "Back"
  end

  test "updating a Campu" do
    visit campus_url
    click_on "Edit", match: :first

    click_on "Update Campu"

    assert_text "Campu was successfully updated"
    click_on "Back"
  end

  test "destroying a Campu" do
    visit campus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Campu was successfully destroyed"
  end
end
