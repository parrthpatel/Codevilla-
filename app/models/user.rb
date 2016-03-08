class User < ActiveRecord::Base
   devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :lockable, :omniauthable
   has_one :github_profile

  def self.from_omniauth(auth) 
	    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		  user.provider = auth.provider
		  user.uid = auth.uid
		  user.email = auth.info.email
		  user.password = Devise.friendly_token[0,20]
		  user.build_github_profile(create_github_profile auth)
		  user.save
	    end
  end  
  
  def self.create_github_profile auth
    { nickname: auth[:info][:nickname]||"",
	  email: auth[:info][:email]||"",
	  name: auth[:info][:name]||"",
	  image: auth[:info][:image]||"",
	  location: auth[:extra][:raw_info][:location]||"",
	  public_repo: auth[:extra][:raw_info][:public_repos]||"",
	  public_gists: auth[:extra][:raw_info][:public_gists]||"",
	  followers: auth[:extra][:raw_info][:followers]||"",
	  following: auth[:extra][:raw_info][:following]||"",
	  member_since: auth[:extra][:raw_info][:created_at]||"",
	  private_repos: auth[:extra][:raw_info][:owned_private_repos]||"",
      github_link: auth[:info][:urls][:Github]||"",
      blog_link: auth[:info][:urls][:Blog]||"",
      bio: auth[:extra][:raw_info][:bio]||"",
	  access_token: auth[:credentials][:token]}
  end
end
