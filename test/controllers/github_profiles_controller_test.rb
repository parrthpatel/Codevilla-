require 'test_helper'

class GithubProfilesControllerTest < ActionController::TestCase
  setup do
    @github_profile = github_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:github_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create github_profile" do
    assert_difference('GithubProfile.count') do
      post :create, github_profile: { access_token: @github_profile.access_token, bio: @github_profile.bio, blog_link: @github_profile.blog_link, email: @github_profile.email, followers: @github_profile.followers, following: @github_profile.following, github_link: @github_profile.github_link, image: @github_profile.image, location: @github_profile.location, member_since: @github_profile.member_since, name: @github_profile.name, nickname: @github_profile.nickname, private_repos: @github_profile.private_repos, public_gists: @github_profile.public_gists, public_repo: @github_profile.public_repo, user_id: @github_profile.user_id }
    end

    assert_redirected_to github_profile_path(assigns(:github_profile))
  end

  test "should show github_profile" do
    get :show, id: @github_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @github_profile
    assert_response :success
  end

  test "should update github_profile" do
    patch :update, id: @github_profile, github_profile: { access_token: @github_profile.access_token, bio: @github_profile.bio, blog_link: @github_profile.blog_link, email: @github_profile.email, followers: @github_profile.followers, following: @github_profile.following, github_link: @github_profile.github_link, image: @github_profile.image, location: @github_profile.location, member_since: @github_profile.member_since, name: @github_profile.name, nickname: @github_profile.nickname, private_repos: @github_profile.private_repos, public_gists: @github_profile.public_gists, public_repo: @github_profile.public_repo, user_id: @github_profile.user_id }
    assert_redirected_to github_profile_path(assigns(:github_profile))
  end

  test "should destroy github_profile" do
    assert_difference('GithubProfile.count', -1) do
      delete :destroy, id: @github_profile
    end

    assert_redirected_to github_profiles_path
  end
end
