require 'test_helper'

class ActressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actress = actresses(:one)
  end

  test "should get index" do
    get actresses_url
    assert_response :success
  end

  test "should get new" do
    get new_actress_url
    assert_response :success
  end

  test "should create actress" do
    assert_difference('Actress.count') do
      post actresses_url, params: { actress: { birth: @actress.birth, birth_place: @actress.birth_place, blood_type: @actress.blood_type, bust: @actress.bust, height: @actress.height, hip: @actress.hip, image_lg: @actress.image_lg, image_sm: @actress.image_sm, initial: @actress.initial, name: @actress.name, ruby: @actress.ruby, waist: @actress.waist } }
    end

    assert_redirected_to actress_url(Actress.last)
  end

  test "should show actress" do
    get actress_url(@actress)
    assert_response :success
  end

  test "should get edit" do
    get edit_actress_url(@actress)
    assert_response :success
  end

  test "should update actress" do
    patch actress_url(@actress), params: { actress: { birth: @actress.birth, birth_place: @actress.birth_place, blood_type: @actress.blood_type, bust: @actress.bust, height: @actress.height, hip: @actress.hip, image_lg: @actress.image_lg, image_sm: @actress.image_sm, initial: @actress.initial, name: @actress.name, ruby: @actress.ruby, waist: @actress.waist } }
    assert_redirected_to actress_url(@actress)
  end

  test "should destroy actress" do
    assert_difference('Actress.count', -1) do
      delete actress_url(@actress)
    end

    assert_redirected_to actresses_url
  end
end
