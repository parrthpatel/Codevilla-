class Article < ActiveRecord::Base
	belongs_to :githubprofile
	acts_as_commontable
	acts_as_votable
	acts_as_taggable_on :tags
	validates :title, :body, presence: true
	

	def score
  		self.get_upvotes.size - self.get_downvotes.size
  	end
end

