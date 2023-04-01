class Apis::V1::PoemsController < ApplicationController
  include Apis::V1::PoemData
  
  def show
    poem = Apis::V1::PoemData::POEMS.sample
    render json: { title: poem[:title], author: poem[:author], text: poem[:text] }
  end

  def search
    found_poem = Object.new
    Apis::V1::PoemData::POEMS.each do |poem| 
      found_poem = poem if poem[:title] == params[:title]
    end
    render json: { title: found_poem[:title],
                    author: found_poem[:author],
                    text: found_poem[:text] }
  end
end
