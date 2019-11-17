class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :update]
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  
  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit
    end
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
   
    # beforeフィルター
    
    # ログイン済みのユーザーか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
    
    
end
