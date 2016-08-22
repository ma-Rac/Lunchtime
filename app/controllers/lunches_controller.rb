class LunchesController < ApplicationController

  def show
  end

  def edit
    session[:return_to] ||= request.referer
    @lunch = Lunch.find(params[:id])
  end

  def update
    @lunch = Lunch.find(params[:id])
    prev = @lunch.paid
    if @lunch.update(lunch_params)
      Log.create(info: "#{current_user.name} updated how much #{@lunch.user.name} paid from #{prev} to #{lunch_params[:paid]} on the #{l(@lunch.lunchtable.created_at,format: :short)} Table")
      redirect_to session.delete(:return_to)
    else
      render :edit
    end
  end

  def new
    @lunch = Lunch.new
  end

  def create
    @table = Lunchtable.find (params[:lunchtable_id])
    users = @table.users
    lunch = Lunch.new(user: current_user, lunchtable: @table, paid: 0)
    if users.where(id: current_user.id).empty?
      if lunch.save
          @table.update_val
          Log.create(info: "#{current_user.name} joined the #{l(@table.created_at,format: :short)} table.")
         redirect_to @table
      end
    else
      redirect_to @table
    end
  end

    def destroy
      @lunch = Lunch.find( params[:id] )
      @table = Lunchtable.find(@lunch.lunchtable_id)
      Log.create(info: "#{current_user.name} left the #{l(@table.created_at,format: :short)} table.")
      @lunch.destroy
      @table.update_val
      redirect_to @table
    end

  private

   def lunch_params
     params.require(:lunch).permit(:paid)
   end
end
