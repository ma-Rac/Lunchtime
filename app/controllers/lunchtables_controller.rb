class LunchtablesController < ApplicationController
  before_action :authenticate_user!
  def index
    @table = Lunchtable.all
  end

  def new
    @lunchtable = Lunchtable.new
  end

  def create
    @lunchtable = Lunchtable.new(params[:id])
    x = lunchtable_params
    x[:total] = (lunchtable_params[:price].to_f * @lunchtable.users.length).to_f
    x[:price] = x[:price].to_i
    if @lunchtable.update(x)
      Log.create(info: "#{current_user.name} created the #{l(@lunchtable.created_at,format: :short)} table.")
      redirect_to @lunchtable, notice: "Success!!1"
    else
      render :edit
    end
  end

  def show
    @lunchtable = Lunchtable.find(params[:id])
    @lunches = Lunch.where(lunchtable: @lunchtable)
    @lunch = @lunches.new
  end

  def destroy
    @lunchtable = Lunchtable.find(params[:id])
    Log.create(info: "#{current_user.name} closed #{l(@lunchtable.created_at,format: :short)} table.")
    Log.create(info: "***************************************************************************************")
    @lunchtable.users.each do |user|
      lunch = user.lunches.find_by(lunchtable: @lunchtable)
      user.update_bal(@lunchtable.price, lunch.paid)
      Log.create(info: "#{user.name}'s balance was updated because of a #{l(@lunchtable.created_at,format: :short)} table closed. (price: #{@lunchtable.price}, paid: #{lunch.paid})")
    end
      Log.create(info: "***************************************************************************************")
    @lunchtable.destroy
    redirect_to lunchtables_path
  end

  def edit
    @lunchtable = Lunchtable.find(params[:id])
  end

  def update
    @lunchtable = Lunchtable.find(params[:id])
    x = lunchtable_params
    prevprice = @lunchtable.price
    x[:total] = (lunchtable_params[:price].to_i * @lunchtable.users.length).to_f
    x[:price] = x[:price].to_i
    if @lunchtable.update(x)
      Log.create(info: "#{current_user.name} updated the price from #{prevprice} to #{x[:price]}")
      redirect_to action: :show, notice: "Success!!1"
    else
      render :edit
    end
  end
  private

  def lunchtable_params
    params.require(:lunchtable).permit(:price)
  end

end
