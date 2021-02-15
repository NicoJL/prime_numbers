require 'test_helper'

class PrimeNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prime_number = prime_numbers(:one)
  end

  test "should get index" do
    get prime_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_prime_number_url
    assert_response :success
  end

  test "should create prime_number" do
    assert_difference('PrimeNumber.count') do
      post prime_numbers_url, params: { prime_number: { prime_number: @prime_number.prime_number } }
    end

    assert_redirected_to prime_number_url(PrimeNumber.last)
  end

  test "should show prime_number" do
    get prime_number_url(@prime_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_prime_number_url(@prime_number)
    assert_response :success
  end

  test "should update prime_number" do
    patch prime_number_url(@prime_number), params: { prime_number: { prime_number: @prime_number.prime_number } }
    assert_redirected_to prime_number_url(@prime_number)
  end

  test "should destroy prime_number" do
    assert_difference('PrimeNumber.count', -1) do
      delete prime_number_url(@prime_number)
    end

    assert_redirected_to prime_numbers_url
  end
end
