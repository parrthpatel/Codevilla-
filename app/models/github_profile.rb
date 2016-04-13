class GithubProfile < ActiveRecord::Base
	belongs_to :user
	has_many :repository
	has_many :articles
	has_many :comments
	
end

