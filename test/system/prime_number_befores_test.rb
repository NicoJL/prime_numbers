require "application_system_test_case"

class PrimeNumberBeforesTest < ApplicationSystemTestCase
  setup do
    @prime_number_before = prime_number_befores(:one)
  end

  test "visiting the index" do
    visit prime_number_befores_url
    assert_selector "h1", text: "Prime Number Befores"
  end

  test "creating a Prime number before" do
    visit prime_number_befores_url
    click_on "New Prime Number Before"

    fill_in "Number", with: @prime_number_before.number
    fill_in "Prime number", with: @prime_number_before.prime_number_id
    click_on "Create Prime number before"

    assert_text "Prime number before was successfully created"
    click_on "Back"
  end

  test "updating a Prime number before" do
    visit prime_number_befores_url
    click_on "Edit", match: :first

    fill_in "Number", with: @prime_number_before.number
    fill_in "Prime number", with: @prime_number_before.prime_number_id
    click_on "Update Prime number before"

    assert_text "Prime number before was successfully updated"
    click_on "Back"
  end

  test "destroying a Prime number before" do
    visit prime_number_befores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prime number before was successfully destroyed"
  end
end
