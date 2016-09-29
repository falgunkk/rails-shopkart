# it defines all actions on items
class ItemsController < ApplicationController
  def index
    @subcategory = Subcategory.find(params[:subcategory_id])
    @items = @subcategory.items.all
  end

  def new
    @subcategory = Subcategory.find(params[:subcategory_id])
    @item = @subcategory.items.new
  end

  def create
    @subcategory = Subcategory.find(params[:subcategory_id])
    @item = @subcategory.items.create(item_params)
    if @item.save
      redirect_to  category_subcategory_items_path, :notice => "Item created."
    else
      redirect_to  category_subcategory_items_path, :notice => "Item not created."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:description, :price)
  end

end

