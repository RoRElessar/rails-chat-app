class RoomsController < ApplicationController
  before_action :set_rooms

  def index; end

  def show
    @room_message = RoomMessage.new(room: @room)
    @room_messages = @room.room_messages.includes(:user)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(permitted_params)
    if @room.save
      redirect_to rooms_path, notice: "Room #{@room.name} was created successfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update(permitted_params)
      redirect_to rooms_path, notice: "Room #{@room.name} was updated successfully"
    else
      render :edit
    end
  end

  private

  def set_rooms
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_params
    params.require(:room).permit(:name)
  end
end
