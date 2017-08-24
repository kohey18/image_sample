class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "追加しました"
      redirect_to action: "index"
    else
      flash[:notice] = "追加できませんでした"
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      flash[:notice] = "更新しました"
      redirect_to @category
    else
      flash[:notice] = "更新できませんでした"
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @pictures = Picture.where(category_id: @category.id)
    @pictures.each do |picture|
      picture.destroy
    end
    if @category.destroy
      flash[:notice] = "削除しました"
      redirect_to categories_url
    else
      flash[:notice] = "削除できませんでした"
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
