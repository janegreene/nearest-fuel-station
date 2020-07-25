class SearchController < ApplicationController
  def index
    @nearest_station = SearchFacade.nearest_station(params)
  end
end
