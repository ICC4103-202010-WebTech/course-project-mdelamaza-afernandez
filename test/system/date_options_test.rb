require "application_system_test_case"

class DateOptionsTest < ApplicationSystemTestCase
  setup do
    @date_option = date_options(:one)
  end

  test "visiting the index" do
    visit date_options_url
    assert_selector "h1", text: "Date Options"
  end

  test "creating a Date option" do
    visit date_options_url
    click_on "New Date Option"

    click_on "Create Date option"

    assert_text "Date option was successfully created"
    click_on "Back"
  end

  test "updating a Date option" do
    visit date_options_url
    click_on "Edit", match: :first

    click_on "Update Date option"

    assert_text "Date option was successfully updated"
    click_on "Back"
  end

  test "destroying a Date option" do
    visit date_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Date option was successfully destroyed"
  end
end
