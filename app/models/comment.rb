class Comment < ActiveRecord::Base
	belongs_to :githubprofile, :article
end
