class ApiController < ApplicationController

  def label
    image = MiniMagick::Image.open(params[:url])
    image.combine_options do |i|
      i.font 'Helvetica'
      i.gravity 'SouthEast'
      i.pointsize 44
      i.fill 'white'
      i.draw "text 20,20 'LGTM'"
    end
    render :text => image.to_blob, :content_type => 'image/jpg'
  end
end
