class TasksController < ApplicationController
  before_action :set_user, only: [:index, :create, :new, :edit, :update]

  def index
  # @tasks = @user.tasks.all
    @tasks = Task.where(user_id: params[:user_id])
  end
  
  def new
    @task = Task.new
  end
  
  def create # 投稿ユーザーと投稿タスクの紐付けが謎
  #  @task = @user.tasks.create(task_params)
     @task = Task.new(task_params)
     @task.user_id = current_user.id
    if @task.save
      flash[:success]="タスクを新規作成しました。"
      redirect_to user_tasks_url(@user)
    else
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  
  private
  
    def task_params
      params.require(:task).permit(:title, :content, :user_id) 
    end
  
   def set_user
     @user = User.find(params[:user_id])
   end
end

