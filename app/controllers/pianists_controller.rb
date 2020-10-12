class PianistsController < ApplicationController
  before_action :move_to_index, except: :index

def index
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

private

def pianist_params
  params.require(:pianist).permit(:school, :repert, :area, :money, :message, :image).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end

end