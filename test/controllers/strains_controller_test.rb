require "test_helper"

class StrainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strain = strains(:one)
  end

  test "should get index" do
    get strains_url
    assert_response :success
  end

  test "should get new" do
    get new_strain_url
    assert_response :success
  end

  test "should create strain" do
    assert_difference('Strain.count') do
      post strains_url, params: { strain: { name: @strain.name, origin: @strain.origin } }
    end

    assert_redirected_to strain_url(Strain.last)
  end

  test "should show strain" do
    get strain_url(@strain)
    assert_response :success
  end

  test "should get edit" do
    get edit_strain_url(@strain)
    assert_response :success
  end

  test "should update strain" do
    patch strain_url(@strain), params: { strain: { name: @strain.name, origin: @strain.origin } }
    assert_redirected_to strain_url(@strain)
  end

  test "should destroy strain" do
    assert_difference('Strain.count', -1) do
      delete strain_url(@strain)
    end

    assert_redirected_to strains_url
  end
end
