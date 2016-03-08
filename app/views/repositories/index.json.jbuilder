json.array!(@repositories) do |repository|
  json.extract! repository, :id, :name, :github_profile_nickname, :full_name, :html_url, :description, :crated_at, :git_url, :svn_url, :watchers_count, :language, :has_issues, :has_wiki, :forks_count, :open_issues_count, :open_issues, :watchers
  json.url repository_url(repository, format: :json)
end
