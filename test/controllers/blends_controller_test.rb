require "test_helper"

class BlendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blend = blends(:one)
  end

  test "should get index" do
    get blends_url
    assert_response :success
  end

  test "should get new" do
    get new_blend_url
    assert_response :success
  end

  test "should create blend" do
    assert_difference('Blend.count') do
      post blends_url, params: { blend: { percentage: @blend.percentage, strain_id: @blend.strain_id, wine_id: @blend.wine_id } }
    end

    assert_redirected_to blend_url(Blend.last)
  end

  test "should show blend" do
    get blend_url(@blend)
    assert_response :success
  end

  test "should get edit" do
    get edit_blend_url(@blend)
    assert_response :success
  end

  test "should update blend" do
    patch blend_url(@blend), params: { blend: { percentage: @blend.percentage, strain_id: @blend.strain_id, wine_id: @blend.wine_id } }
    assert_redirected_to blend_url(@blend)
  end

  test "should destroy blend" do
    assert_difference('Blend.count', -1) do
      delete blend_url(@blend)
    end

    assert_redirected_to blends_url
  end
end
