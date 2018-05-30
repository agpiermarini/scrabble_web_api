class WordSearchController < ApplicationController
  def index
    @word_search = WordSearch.new(params[:word])
  end
end
