class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy, :order]

  # GET /pictures
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:notice] = "追加しました"
      redirect_to action: "index"
    else
      render :new
    end
  end

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      flash[:notice] = "更新しました"
      redirect_to @picture
    else
      flash[:notice] = "更新できませんでした"
      render :edit
    end
  end

  # DELETE /pictures/1
  def destroy
    if @picture.destroy
      flash[:notice] = "削除しました"
      redirect_to pictures_url
    else
      flash[:notice] = "削除できませんでした"
      render :index
    end
  end

  def order
    case params[:order].to_i
      when 1
        @picture.move_higher
      when 2
        @picture.move_lower
      when 3
        @picture.move_to_top
      when 4
        @picture.move_to_bottom
    end
    redirect_to pictures_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :image, :position)
    end
end
