class WelcomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    client = Octokit::Client.new(:access_token => current_user.github_profile.access_token)
    @repositories = client.repos
    @pocs = @repositories.paginate(params[:page], 8)
    render layout: "authen"
  end

  
  def profile
    @repositories = Repository.where(github_profile_nickname: current_user.github_profile.nickname)
  	render layout: "authen"
  end


  def mypocs
    @repositories = Repository.where(github_profile_nickname: current_user.github_profile.nickname)
    @repos = @repositories.paginate(:page => params[:page], :per_page => 8)
    render layout: "authen"
  end
=begin
  
  def buy_poc
      redirect_to @repositories.paypal_url(show_repositery_path())
  end
=end
end
