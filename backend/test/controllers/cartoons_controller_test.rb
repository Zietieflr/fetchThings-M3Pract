require 'test_helper'

class CartoonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartoon = cartoons(:one)
  end

  test "should get index" do
    get cartoons_url, as: :json
    assert_response :success
  end

  test "should create cartoon" do
    assert_difference('Cartoon.count') do
      post cartoons_url, params: { cartoon: { image_url: @cartoon.image_url, name: @cartoon.name } }, as: :json
    end

    assert_response 201
  end

  test "should show cartoon" do
    get cartoon_url(@cartoon), as: :json
    assert_response :success
  end

  test "should update cartoon" do
    patch cartoon_url(@cartoon), params: { cartoon: { image_url: @cartoon.image_url, name: @cartoon.name } }, as: :json
    assert_response 200
  end

  test "should destroy cartoon" do
    assert_difference('Cartoon.count', -1) do
      delete cartoon_url(@cartoon), as: :json
    end

    assert_response 204
  end
end
