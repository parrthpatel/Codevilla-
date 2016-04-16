class Article < ActiveRecord::Base
	belongs_to :githubprofile
	acts_as_commentable
end

