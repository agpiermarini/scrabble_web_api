class WordSearchController < ApplicationController
  def index
    @word = WordSearch.new(params[:word]).word
  end
end
