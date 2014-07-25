class ApiController < ApplicationController

  def label
    image = MiniMagick::Image.open(params[:url])

    lgtm = MiniMagick::Image.open("#{Rails.root}/app/assets/images/lgtm.png")
    lgtm.resize "#{image['width'] / 2}x#{image['height'] / 2}"
    result = image.composite(lgtm) do |c|
      c.geometry '+20+20'
      c.gravity 'SouthEast'
    end
    render :text => result.to_blob, :content_type => 'image/jpg'
  end
end
