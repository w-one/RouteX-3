require 'test_helper'

class HowTosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @how_to = how_tos(:one)
  end

  test "should get index" do
    get how_tos_url
    assert_response :success
  end

  test "should get new" do
    get new_how_to_url
    assert_response :success
  end

  test "should create how_to" do
    assert_difference('HowTo.count') do
      post how_tos_url, params: { how_to: { content: @how_to.content, image: @how_to.image, title: @how_to.title, user_id: @how_to.user_id, video: @how_to.video } }
    end

    assert_redirected_to how_to_url(HowTo.last)
  end

  test "should show how_to" do
    get how_to_url(@how_to)
    assert_response :success
  end

  test "should get edit" do
    get edit_how_to_url(@how_to)
    assert_response :success
  end

  test "should update how_to" do
    patch how_to_url(@how_to), params: { how_to: { content: @how_to.content, image: @how_to.image, title: @how_to.title, user_id: @how_to.user_id, video: @how_to.video } }
    assert_redirected_to how_to_url(@how_to)
  end

  test "should destroy how_to" do
    assert_difference('HowTo.count', -1) do
      delete how_to_url(@how_to)
    end

    assert_redirected_to how_tos_url
  end
end
