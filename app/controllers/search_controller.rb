class SearchController < ApplicationController
  def repository
  	render layout: "authen"
  end

  def articles
  	render layout: "authen"
  end
end
