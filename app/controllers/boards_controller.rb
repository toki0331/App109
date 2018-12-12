class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @boards = Board.all
    # @idhen = Board.find_by(id: paramas[:id])
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_param)

    if @board.save
      flash[:notice] = "Created!!"
      redirect_to boards_path
    else
      render("/boards/new")
    end
  end

  def edit
    @board_edit = Board.new
    @board = Board.find_by(id: params[:id])
  end

  def update
    @board_old = Board.find_by(id: params[:id])
    @board_old.name = params[:name]
    @board_old.title = params[:title]
    @board_old.body = params[:body]

    if @board_old.save
      flash[:notice] = "Update!!"
      redirect_to("/boards/index")
    else
      render("/boards/new")
    end
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    @board.destroy
    flash[:notice] = "Destroy!!"
    redirect_to("/boards/index")
  end

  private
    def board_param
      params.require(:board).permit(:name, :title, :body)
    end

end
