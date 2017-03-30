class ItemsController < ApplicationController
  def index

    @items = Item.all


    render :'items/index'
  end

  def show

     #load all items
     @item = Item.find params[:id]


      render :'items/show'
  end

  def edit
      #load all items
     @item = Item.find params[:id]

  end

  def update
     
      item = Item.find params[:id]
   
    if item.update(item_params)
      redirect_to item
    else
      render 'edit'
  end
    

  end

  def delete
  end

  def new


  end

  def create
     item = Item.create(item_params)

     item.save

      redirect_to item
  end

private
  def item_params
    params.require(:item).permit(:item_model, :item_serial_number )
  end
end