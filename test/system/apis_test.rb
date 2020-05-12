require "application_system_test_case"

class APIsTest < ApplicationSystemTestCase
  setup do
    @api = apis(:one)
  end

  test "visiting the index" do
    visit apis_url
    assert_selector "h1", text: "Ap Is"
  end

  test "creating a API" do
    visit apis_url
    click_on "New API"

    click_on "Create API"

    assert_text "API was successfully created"
    click_on "Back"
  end

  test "updating a API" do
    visit apis_url
    click_on "Edit", match: :first

    click_on "Update API"

    assert_text "API was successfully updated"
    click_on "Back"
  end

  test "destroying a API" do
    visit apis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "API was successfully destroyed"
  end
end
