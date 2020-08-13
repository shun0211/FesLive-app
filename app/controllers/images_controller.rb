class ImagesController < ApplicationController
  def index
    @events = Event.all.order("event_first_day DESC")
    like_number = ImageLike.group(:image_id).count
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

  def download
    @image = Image.find(params[:id])
    @event = Event.find(@image.event_id)
    file_name = @event.event_name + "_photograph_" + @image.id.to_s
    # 次の行の記述でURLを記載できたので不採用
    # file_path = Rails.root.join('public', 'uploads', 'image', 'photograph', "#{@image.id}", "#{@image.photograph}")
    file_path = @image.photograph.file.file
    send_file(file_path,
    filename: file_name,
    type: 'application/octet-stream',
    disposition: 'attachment'
    )

  end

  private
  def image_params
    params.require(:image).permit(:user_id, :event_id, { photograph: [] }).merge(user_id: current_user.id)
  end

end
