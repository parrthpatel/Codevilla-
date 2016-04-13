class Article < ActiveRecord::Base
	belongs_to :githubprofile
	has_many :comments
end

