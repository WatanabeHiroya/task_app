class TasksController < ApplicationController
  def index
    @user=User.find(params[:user_id])
    @tasks=Task.where(params[:user_id])
  end
end
