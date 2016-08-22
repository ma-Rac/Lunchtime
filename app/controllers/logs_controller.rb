class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def destroy
    Log.destroy_all
    Log.create(info: "#{current_user.name} flushed all of the logs on #{Time.now}")
    redirect_to logs_index_path
  end
end
