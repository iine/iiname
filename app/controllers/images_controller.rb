class ImagesController < ApplicationController

  def index
    count = params["count"]
    @images = Image.all.shuffle.first(count.to_i)
  end

end
