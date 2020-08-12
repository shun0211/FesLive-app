class ImagesController < ApplicationController
  def index
    @events = Event.all.order("event_first_day DESC")
    like_number = Like.group(:image_id).count
    images_sorted = like_number.keys.compact.sort
    # => [2, 4, 1 ...] いいねが多い写真のid順に入っている
    all_images_id = Image.all.ids
    all_images_sorted = images_sorted.push(all_images_id).flatten!.uniq!
    @images = Image.find(all_images_sorted)
  end

  def new
    @events = Event.all
    @image = Image.new
  end

  def create
    params[:image][:photograph].each do |photograph|
      new_image = Image.new(event_id: params[:image][:event_id], photograph: photograph, user_id: current_user.id)
      new_image.save
    end
    redirect_to images_path
  end

  def show
    @image = Image.find(params[:id])
    @event = Event.find(@image.event_id)
    @comments = @image.comment_to_images
    @comment = CommentToImage.new
    gon.image = @image
  end


  private
  def image_params
    params.require(:image).permit(:user_id, :event_id, { photograph: [] }).merge(user_id: current_user.id)
  end

end
