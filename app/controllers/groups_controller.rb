class GroupsController < ApplicationController
  before_action :signed_in?
  def index
    @prompt = 'Expense Categories'
    @categories = Group.where(user_id: current_user)
  end

  def new
    @group = Group.new
    @prompt = 'Create a Category'
    @back = root_path
    @group = Group.new
    @emojis = ["\u{1F354}", "\u{1F957}", "\u{2708}", "\u{1F697}", "\u{1F68C}", "\u{1F4B0}", "\u{1F4B3}", "\u{1F527}",
               "\u{1F3BC}"]
  end

  def create
    @prompt = 'Create Expense Category'
    @back = root_path
    @user = current_user
    @group = Group.new(group_params)
    @group.user_id = @user.id
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
