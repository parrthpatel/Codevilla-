class GithubProfilesController < ApplicationController
  before_action :set_github_profile, only: [:show, :edit, :update]
  def show
    render layout: "authen"
  end

  

  # GET /github_profiles/1/edit
  def edit
    render layout: "authen"
  end

  def update

    respond_to do |format|
      if @github_profile.update(github_profile_params)
        format.html { redirect_to @github_profile, notice: 'Github profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @github_profile }
      else
        format.html { render :edit }
        format.json { render json: @github_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /github_profiles/1
  # DELETE /github_profiles/1.json
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_github_profile
      @github_profile = GithubProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def github_profile_params
      params.require(:github_profile).permit(:user_id, :nickname, :email, :name, :image, :location, :public_repo, :public_gists, :followers, :following, :member_since, :private_repos, :github_link, :blog_link, :bio)
    end
end
