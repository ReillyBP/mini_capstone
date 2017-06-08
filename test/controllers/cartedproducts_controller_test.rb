require 'test_helper'

class CartedproductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cartedproducts_index_url
    assert_response :success
  end

  test "should get create" do
    get cartedproducts_create_url
    assert_response :success
  end

end
