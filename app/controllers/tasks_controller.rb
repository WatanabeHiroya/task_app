class TasksController < ApplicationController
  before_action :set_user, only: [:index, :create]

  def index
    @tasks = Task.where(user_id: params[:user_id])
  end
  
  def new
    @task = Task.new
  end
  
  def create # 投稿ユーザーと投稿タスクの紐付けが謎
    @task = Task.new(task_params)
    if @task.save
      flash[:success]="タスクを新規作成しました。"
      redirect_to user_tasks_url(@user)
    else
      render :new
    end
  end
  
  
  private
  
    def task_params
      params.require(:task).permit(:title, :content, :user_id) # このuser_idもいるのか？
    end
  
   def set_user
     @user = User.find(params[:user_id])
   end
end

