class Repository < ActiveRecord::Base
	belongs_to :github_profile
	#validates :codezip, :name, presence: true
	mount_uploader :codezip, CodezipUploader
	acts_as_taggable_on :tags
    serialize :notification_params, Hash


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
end
