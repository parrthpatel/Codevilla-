class Repository < ActiveRecord::Base
	belongs_to :github_profile
	validates :codezip, :name, presence: true
	mount_uploader :codezip, CodezipUploader
end
