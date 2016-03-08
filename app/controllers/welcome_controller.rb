class WelcomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    client = Octokit::Client.new(:access_token => current_user.github_profile.access_token)
    @repositories = client.repos
    render layout: "authen"
  end

  def table
  	render layout: "authen"
  end
  
  def form
  	render layout: "authen"
  end
  
  def profile
  	render layout: "authen"
  end
  
  def login  
  end
  
  def lock
  end

  def register
  end

end
