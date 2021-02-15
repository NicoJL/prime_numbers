require 'test_helper'

class PrimeNumberBeforesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prime_number_before = prime_number_befores(:one)
  end

  test "should get index" do
    get prime_number_befores_url
    assert_response :success
  end

  test "should get new" do
    get new_prime_number_before_url
    assert_response :success
  end

  test "should create prime_number_before" do
    assert_difference('PrimeNumberBefore.count') do
      post prime_number_befores_url, params: { prime_number_before: { number: @prime_number_before.number, prime_number_id: @prime_number_before.prime_number_id } }
    end

    assert_redirected_to prime_number_before_url(PrimeNumberBefore.last)
  end

  test "should show prime_number_before" do
    get prime_number_before_url(@prime_number_before)
    assert_response :success
  end

  test "should get edit" do
    get edit_prime_number_before_url(@prime_number_before)
    assert_response :success
  end

  test "should update prime_number_before" do
    patch prime_number_before_url(@prime_number_before), params: { prime_number_before: { number: @prime_number_before.number, prime_number_id: @prime_number_before.prime_number_id } }
    assert_redirected_to prime_number_before_url(@prime_number_before)
  end

  test "should destroy prime_number_before" do
    assert_difference('PrimeNumberBefore.count', -1) do
      delete prime_number_before_url(@prime_number_before)
    end

    assert_redirected_to prime_number_befores_url
  end
end
