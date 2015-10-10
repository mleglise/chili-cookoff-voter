class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def index
    @categories = @event.categories
  end

  def new
    @category = Category.new(event: @event)
  end

  # GET /events/1/categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /events/1/categories
  # POST /events/1/categories.json
  def create
    @category = Category.new(category_params)
    @category.event = @event

    respond_to do |format|
      if @category.save
        format.html { redirect_to @event, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1/categories/1
  # PATCH/PUT /events/1/categories/1.json
  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @event, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
