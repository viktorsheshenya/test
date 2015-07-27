class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  def index
     @items = Item.all
     @item = Item.new
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path }
        format.json { render json: { item: render_to_string(partial: "item", locals: { item: @item }, formats: [:html] ) } }
      else
        format.json { }
      end
    end
  end

  def edit
    # respond_to do |format|
    #   format.json { render json: { item: render_to_string(partial: "item", locals: { item: @item }, formats: [:html] ) } }
    # end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path }
        format.json { render json: { item: render_to_string(partial: "item", locals: { item: @item }, formats: [:html] ) } }
      else
        format.json { }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @item.present?
        @item.destroy
        format.html { redirect_to items_path }
        format.json { render json: { item: @item.id} }
      end
    end
  end

private
  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :picture)
  end
end
