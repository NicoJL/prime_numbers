require "application_system_test_case"

class PrimeNumbersTest < ApplicationSystemTestCase
  setup do
    @prime_number = prime_numbers(:one)
  end

  test "visiting the index" do
    visit prime_numbers_url
    assert_selector "h1", text: "Prime Numbers"
  end

  test "creating a Prime number" do
    visit prime_numbers_url
    click_on "New Prime Number"

    fill_in "Prime number", with: @prime_number.prime_number
    click_on "Create Prime number"

    assert_text "Prime number was successfully created"
    click_on "Back"
  end

  test "updating a Prime number" do
    visit prime_numbers_url
    click_on "Edit", match: :first

    fill_in "Prime number", with: @prime_number.prime_number
    click_on "Update Prime number"

    assert_text "Prime number was successfully updated"
    click_on "Back"
  end

  test "destroying a Prime number" do
    visit prime_numbers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prime number was successfully destroyed"
  end
end
