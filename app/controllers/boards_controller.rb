class BoardsController < ApplicationController
  def index
    @boards = Board.all
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

  end

  def update

  end

  def destroy

  end

  private
    def board_param
      params.require(:board).permit(:name, :title, :body)
    end

end
