json.array!(@github_profiles) do |github_profile|
  json.extract! github_profile, :id, :user_id, :nickname, :email, :name, :image, :location, :public_repo, :public_gists, :followers, :following, :member_since, :private_repos, :github_link, :blog_link, :bio, :access_token
  json.url github_profile_url(github_profile, format: :json)
end
