require "application_system_test_case"

class BlendsTest < ApplicationSystemTestCase
  setup do
    @blend = blends(:one)
  end

  test "visiting the index" do
    visit blends_url
    assert_selector "h1", text: "Blends"
  end

  test "creating a Blend" do
    visit blends_url
    click_on "New Blend"

    fill_in "Percentage", with: @blend.percentage
    fill_in "Strain", with: @blend.strain_id
    fill_in "Wine", with: @blend.wine_id
    click_on "Create Blend"

    assert_text "Blend was successfully created"
    click_on "Back"
  end

  test "updating a Blend" do
    visit blends_url
    click_on "Edit", match: :first

    fill_in "Percentage", with: @blend.percentage
    fill_in "Strain", with: @blend.strain_id
    fill_in "Wine", with: @blend.wine_id
    click_on "Update Blend"

    assert_text "Blend was successfully updated"
    click_on "Back"
  end

  test "destroying a Blend" do
    visit blends_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blend was successfully destroyed"
  end
end
