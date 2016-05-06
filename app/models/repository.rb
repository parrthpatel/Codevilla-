class Repository < ActiveRecord::Base
	
  belongs_to :github_profile
	validates :codezip, :description, :name, presence: true
	mount_uploader :codezip, CodezipUploader
	acts_as_taggable_on :tags
  serialize :notification_params, Hash
  has_and_belongs_to_many :categories
  #multisearchable  against: [:name, :github_profile_nickname, :description, :language], using: [:tsearch, :trigram]
  #pg_search_scope :search_by_field, against: [:name, :github_profile_nickname, :description, :language] , using: [:tsearch, :trigram]

  def self.search(query)
    where('name LIKE ? OR github_profile_nickname LIKE ? OR description LIKE ? OR language LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
  end
  
end
=begin
  if(Payment.count == 0)
    @invoice=1
  else
    @invoice=Payment.pluck(:id).max+1
  end
	def paypal_url(return_path)
    values = {
        business: "parth1634-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: @invoice,
        amount: 10,
        item_name: self.name,
        item_number: self.id,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
=end

  

