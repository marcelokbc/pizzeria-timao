class OrdersController < ApplicationController
  before_action :set_table
  before_action :set_order, only: %i[show edit update destroy]
  
  def new
    @order = @table.orders.build(user: current_user)
  end
  
  def create
    @order = @table.orders.build(order_params.merge(user: current_user))
    
    if @order.save
      flash[:success] = "Pedido criado com sucesso!"
      redirect_to table_path(@table)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @order_items = @order.order_items.includes(:menu_item)
  end

  private

  def set_table
    @table = Table.find(params[:table_id])
  end

  def set_order
    @order = @table.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(order_items_attributes: [:menu_item_id, :quantity, :price])
  end
end
