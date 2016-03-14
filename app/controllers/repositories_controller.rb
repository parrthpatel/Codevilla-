class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @articles = Repository.tagged_with(params[:tag])
    else
      @repositories = Repository.all
    end
    render layout: "authen"
  end


  def show
    render layout: "authen"
  end


  def new
    @repository = Repository.new
    @id = params[:id_param]
    @name = params[:name_param]
    @full_name = params[:fullname_param]
    @maker = current_user.github_profile.nickname
    @html_url= params[:html_url_param]
    @description = params[:description_param]
    @fork = params[:fork_param]
    @crated_at = params[:crated_at_param]
    @git_url = params[:git_url_param]
    @ssh_url = params[:ssh_url_param]
    @clone_url = params[:clone_url_param]
    @watchers_count = params[:watchers_count_param]
    @language = params[:language_param]
    @has_issues = params[:has_issues_param]
    @has_downloads = params[:has_downloads_param]
    @has_wiki = params[:has_wiki_param]
    @forks_count = params[:forks_count_param]
    @open_issues_count = params[:open_issues_count_param]
    @open_issues = params[:open_issues_param]
    @watchers = params[:watchers_param]
=begin
        for feature changes in this controller we have to fetch it data second time
    to github :due to limit of restfules method (it is 2000 something charaters)
    i am write some lines of code here we can make it change into it to
    make it execersice simple....

    user = Octokit.user current_user.github_profile.nickname
    client = Octokit::Client.new(:access_token => current_user.github_profile.access_token)
    @repos = user.rels[:repos].get.data.select {|r| r[:id] == @foo }

        using map we can fetch the data from the arra with has inside hash

        like example of it ====> repos.map{|item| item['full_name']}
          
          for sample of it go to irb
            >> require 'octokit'
            >> user = Octokit.user 'parth1634'
            >> repos = user.rels[:repos].get.data.select {|r| r[:id] == 36374 } # this id is grab
            >> repos.map{|item| item['full_name']}
=end
    render layout: "authen"
  end


  def edit
    render layout: "authen"
  end


  def create
    @repository = Repository.new(repository_params)
    respond_to do |format|
      if @repository.save
        format.html { redirect_to @repository, notice: 'Repository was successfully created.' }
        format.json { render :show, status: :created, location: @repository }
      else
        format.html { render :new }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @repository.update(repository_params)
        format.html { redirect_to @repository, notice: 'Repository was successfully updated.' }
        format.json { render :show, status: :ok, location: @repository }
      else
        format.html { render :edit }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @repository.destroy
    respond_to do |format|
      format.html { redirect_to repositories_url, notice: 'Repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    def set_repository
      @repository = Repository.find(params[:id])
    end

    def repository_params
      params.require(:repository).permit(:repo_id, :name, :full_name, :github_profile_nickname, :html_url, :description, :fork, :crated_at, :git_url, :ssh_url, :clone_url, :watchers_count, :language, :has_issues, :has_downloads, :has_wiki, :forks_count, :open_issues_count, :open_issues, :watchers, :foo_param, :codezip, :tag_list)
    end
end
