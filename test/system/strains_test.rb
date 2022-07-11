require "application_system_test_case"

class StrainsTest < ApplicationSystemTestCase
  setup do
    @strain = strains(:one)
  end

  test "visiting the index" do
    visit strains_url
    assert_selector "h1", text: "Strains"
  end

  test "creating a Strain" do
    visit strains_url
    click_on "New Strain"

    fill_in "Name", with: @strain.name
    fill_in "Origin", with: @strain.origin
    click_on "Create Strain"

    assert_text "Strain was successfully created"
    click_on "Back"
  end

  test "updating a Strain" do
    visit strains_url
    click_on "Edit", match: :first

    fill_in "Name", with: @strain.name
    fill_in "Origin", with: @strain.origin
    click_on "Update Strain"

    assert_text "Strain was successfully updated"
    click_on "Back"
  end

  test "destroying a Strain" do
    visit strains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Strain was successfully destroyed"
  end
end
