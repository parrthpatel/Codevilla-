class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.integer :repo_id
      t.string :name
      t.string :full_name
      t.string :github_profile_nickname
      t.string :html_url
      t.text :description
      t.boolean :fork
      t.datetime :crated_at
      t.string :git_url
      t.string :ssh_url
      t.string :clone_url
      t.integer :watchers_count
      t.string :language
      t.boolean :has_issues
      t.boolean :has_downloads
      t.boolean :has_wiki
      t.integer :forks_count
      t.integer :open_issues_count
      t.boolean :open_issues
      t.integer :watchers

      t.timestamps null: false
    end
  end
end
