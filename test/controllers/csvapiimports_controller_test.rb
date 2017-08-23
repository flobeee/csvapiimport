require 'test_helper'

class CsvapiimportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csvapiimports_index_url
    assert_response :success
  end

  test "should get import" do
    get csvapiimports_import_url
    assert_response :success
  end

end
