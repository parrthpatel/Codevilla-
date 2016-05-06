class SearchController < ApplicationController
  before_action :authenticate_user!
  

  def list 
  	if params[:search].blank?

      @pg_search_documents = Repository.paginate(:per_page => 12, :page => params[:page])
    else
      @pg_search_documents = Repository.search(params[:search]).paginate(:per_page => 12, :page => params[:page])    
    end
    render layout: "authen"
  end

  def search
  end
end
