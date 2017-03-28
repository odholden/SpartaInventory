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
  end

  def update
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
