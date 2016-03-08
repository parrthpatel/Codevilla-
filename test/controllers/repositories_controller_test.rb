require 'test_helper'

class RepositoriesControllerTest < ActionController::TestCase
  setup do
    @repository = repositories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repositories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repository" do
    assert_difference('Repository.count') do
      post :create, repository: { clone_url: @repository.clone_url, crated_at: @repository.crated_at, description: @repository.description, fork: @repository.fork, forks_count: @repository.forks_count, full_name: @repository.full_name, git_url: @repository.git_url, github_profile_nickname: @repository.github_profile_nickname, has_downloads: @repository.has_downloads, has_issues: @repository.has_issues, has_wiki: @repository.has_wiki, html_url: @repository.html_url, language: @repository.language, name: @repository.name, open_issues: @repository.open_issues, open_issues_count: @repository.open_issues_count, repo_id: @repository.repo_id, ssh_url: @repository.ssh_url, watchers: @repository.watchers, watchers_count: @repository.watchers_count }
    end

    assert_redirected_to repository_path(assigns(:repository))
  end

  test "should show repository" do
    get :show, id: @repository
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repository
    assert_response :success
  end

  test "should update repository" do
    patch :update, id: @repository, repository: { clone_url: @repository.clone_url, crated_at: @repository.crated_at, description: @repository.description, fork: @repository.fork, forks_count: @repository.forks_count, full_name: @repository.full_name, git_url: @repository.git_url, github_profile_nickname: @repository.github_profile_nickname, has_downloads: @repository.has_downloads, has_issues: @repository.has_issues, has_wiki: @repository.has_wiki, html_url: @repository.html_url, language: @repository.language, name: @repository.name, open_issues: @repository.open_issues, open_issues_count: @repository.open_issues_count, repo_id: @repository.repo_id, ssh_url: @repository.ssh_url, watchers: @repository.watchers, watchers_count: @repository.watchers_count }
    assert_redirected_to repository_path(assigns(:repository))
  end

  test "should destroy repository" do
    assert_difference('Repository.count', -1) do
      delete :destroy, id: @repository
    end

    assert_redirected_to repositories_path
  end
end
