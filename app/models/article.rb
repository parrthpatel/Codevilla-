class Article < ActiveRecord::Base
	belongs_to :githubprofile
	acts_as_commontable
	acts_as_votable
end

