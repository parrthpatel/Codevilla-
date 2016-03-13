class Repository < ActiveRecord::Base
	belongs_to :github_profile
	validates :codezip, :name, presence: true
	mount_uploader :codezip, CodezipUploader
	attr_accessible :tag_list
	acts_as_taggable
end
