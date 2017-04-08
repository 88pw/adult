require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { actress_id: @post.actress_id, ad_url: @post.ad_url, description: @post.description, director_id: @post.director_id, label_id: @post.label_id, maker_id: @post.maker_id, review_score: @post.review_score, series_id: @post.series_id, service_id: @post.service_id, service_url: @post.service_url, thumbnail_url: @post.thumbnail_url, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { actress_id: @post.actress_id, ad_url: @post.ad_url, description: @post.description, director_id: @post.director_id, label_id: @post.label_id, maker_id: @post.maker_id, review_score: @post.review_score, series_id: @post.series_id, service_id: @post.service_id, service_url: @post.service_url, thumbnail_url: @post.thumbnail_url, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
