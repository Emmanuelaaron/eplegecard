require "test_helper"

class PledgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pledger = pledgers(:one)
  end

  test "should get index" do
    get pledgers_url
    assert_response :success
  end

  test "should get new" do
    get new_pledger_url
    assert_response :success
  end

  test "should create pledger" do
    assert_difference('Pledger.count') do
      post pledgers_url, params: { pledger: { amount: @pledger.amount, expecteddate: @pledger.expecteddate, fullfilled: @pledger.fullfilled, name: @pledger.name, phonenumber: @pledger.phonenumber } }
    end

    assert_redirected_to pledger_url(Pledger.last)
  end

  test "should show pledger" do
    get pledger_url(@pledger)
    assert_response :success
  end

  test "should get edit" do
    get edit_pledger_url(@pledger)
    assert_response :success
  end

  test "should update pledger" do
    patch pledger_url(@pledger), params: { pledger: { amount: @pledger.amount, expecteddate: @pledger.expecteddate, fullfilled: @pledger.fullfilled, name: @pledger.name, phonenumber: @pledger.phonenumber } }
    assert_redirected_to pledger_url(@pledger)
  end

  test "should destroy pledger" do
    assert_difference('Pledger.count', -1) do
      delete pledger_url(@pledger)
    end

    assert_redirected_to pledgers_url
  end
end
