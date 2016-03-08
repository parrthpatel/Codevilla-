json.array!(@repositories) do |repository|
  json.extract! repository, :id, :repo_id, :name, :full_name, :github_profile_nickname, :html_url, :description, :fork, :crated_at, :git_url, :ssh_url, :clone_url, :watchers_count, :language, :has_issues, :has_downloads, :has_wiki, :forks_count, :open_issues_count, :open_issues, :watchers
  json.url repository_url(repository, format: :json)
end
