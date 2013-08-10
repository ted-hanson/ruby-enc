class NodesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @nodes = Node.order(sort_column + " " + sort_direction)
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(params[:node])
    if @node.save
      redirect_to nodes_path
    else
      render 'new'
    end
  end

  def show
    @node = Node.find_by_name(params[:id])
  end

  def edit
    @node = Node.find_by_name(params[:id])
  end

  def destroy
    @node = Node.find_by_name(params[:id])
    @node.destroy
    redirect_to nodes_path
  end

  def update
    @node = Node.find_by_name(params[:id])
    if @node.update_attributes(params[:node])
      redirect_to nodes_path
    else
      render 'edit'
    end
  end

  private

  def sort_column
    Node.column_names.include?(params[:sort]) ? params[:sort] : "last_report"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
