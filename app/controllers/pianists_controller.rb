class PianistsController < ApplicationController
  before_action :move_to_index, except: :index

def index
  @pianists = Pianist.order('created_at DESC')

end

def new
  @pianist = Pianist.new
end

def create
  @pianist = Pianist.new(pianist_params)
  if @pianist.valid?
     @pianist.save
     redirect_to action: :index
  else
    render :new
  end
end

def show
  @pianist = Pianist.find(params[:id])
end

def edit
  @pianist = Pianist.find(params[:id])
end

def update
  @pianist = Pianist.find(params[:id])
  if @pianist.update(pianist_params)
        redirect_to action: :show
  else
    render :edit
  end
end

private

def pianist_params
  params.require(:pianist).permit(:school, :repert, :area, :money, :message, :image).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end

end