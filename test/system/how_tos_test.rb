require "application_system_test_case"

class HowTosTest < ApplicationSystemTestCase
  setup do
    @how_to = how_tos(:one)
  end

  test "visiting the index" do
    visit how_tos_url
    assert_selector "h1", text: "How Tos"
  end

  test "creating a How to" do
    visit how_tos_url
    click_on "New How To"

    fill_in "Content", with: @how_to.content
    fill_in "Image", with: @how_to.image
    fill_in "Title", with: @how_to.title
    fill_in "User", with: @how_to.user_id
    fill_in "Video", with: @how_to.video
    click_on "Create How to"

    assert_text "How to was successfully created"
    click_on "Back"
  end

  test "updating a How to" do
    visit how_tos_url
    click_on "Edit", match: :first

    fill_in "Content", with: @how_to.content
    fill_in "Image", with: @how_to.image
    fill_in "Title", with: @how_to.title
    fill_in "User", with: @how_to.user_id
    fill_in "Video", with: @how_to.video
    click_on "Update How to"

    assert_text "How to was successfully updated"
    click_on "Back"
  end

  test "destroying a How to" do
    visit how_tos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "How to was successfully destroyed"
  end
end
