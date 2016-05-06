class AddGithubProfileIdFromRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :github_profile_id, :integer
  end
end
