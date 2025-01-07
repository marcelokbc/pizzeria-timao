class TablesController < ApplicationController
  before_action :set_table, only: %i[show update]

  def index
    @tables = Table.all
  end

  def show
    @menus = Menu.all
    @selected_menu = params[:menu_id].present? ? Menu.find(params[:menu_id]) : @menus.first
    @menu_items = @selected_menu.menu_items if @selected_menu.present?
  end

  def update; end

  private

  def set_table
    @table = Table.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:status, :user_id)
  end
end
