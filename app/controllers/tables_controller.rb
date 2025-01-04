class TablesController < ApplicationController
  before_action :set_table, only: %i[show update]

  def index
    @tables = Table.all
  end

  def show
    @menus = Menu.all
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
