class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
    
  def show
    @item = Item.find_by_id(params[:id])
  end
  
  def new
    # @item = Item.new
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @item = @shopping_list.items.build
  end

  def edit
    @item = Items.find(params[:id])
  end
  
  def create
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @item = @shopping_list.items.create(item_params)
    
    if @item.save
      redirect_to shopping_list_path(@shopping_list)
    else
      render 'new'
    end
  end
  
  def update
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      redirect_to shopping_list_path(@shopping_list)
    else
      render 'edit'
    end
  end
  
  def destroy
    @shopping_list = ShoppingList.find(params[:shopping_list_id])
    @item = Item.find(params[:id])
    
    @item.destroy
    
    redirect_to shopping_list_path(@shopping_list)
  end
  
  private
    def item_params
      params.require(:item).permit(:name, :description, :quantity, :shopping_list_id)
    end
    
end
