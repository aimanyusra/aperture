require 'test_helper'

class PhotoImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_image = photo_images(:one)
  end

  test "should get index" do
    get photo_images_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_image_url
    assert_response :success
  end

  test "should create photo_image" do
    assert_difference('PhotoImage.count') do
      post photo_images_url, params: { photo_image: {  } }
    end

    assert_redirected_to photo_image_url(PhotoImage.last)
  end

  test "should show photo_image" do
    get photo_image_url(@photo_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_image_url(@photo_image)
    assert_response :success
  end

  test "should update photo_image" do
    patch photo_image_url(@photo_image), params: { photo_image: {  } }
    assert_redirected_to photo_image_url(@photo_image)
  end

  test "should destroy photo_image" do
    assert_difference('PhotoImage.count', -1) do
      delete photo_image_url(@photo_image)
    end

    assert_redirected_to photo_images_url
  end
end
