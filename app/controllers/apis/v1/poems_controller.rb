class Apis::V1::PoemsController < ApplicationController
  include Apis::V1::PoemData
  
  def show
    poem = Apis::V1::PoemData::POEMS.first #sample
    render json: { title: poem[:title], author: poem[:author], text: poem[:text] }
  end
end
