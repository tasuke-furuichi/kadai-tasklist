class TasksController < ApplicationController
  before_action:require_user_logged_in,only:[:index,:show, :edit,:create,:new,:destroy,:update]
  before_action :correct_user, only: [:destroy, :edit, :show, :update]
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success]="タスクを作成しました"
      redirect_to @task
    else
      flash.now[:danger]="タスク作成に失敗しました"
      render :new
    end
  end
  
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success]="タスクを編集しました"
      redirect_to @task
    else
      flash.now[:danger]="タスクを編集できませんでした"
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success]="タスクを削除しました"
    redirect_to tasks_url
  end
    
  private
  def task_params
    params.require(:task).permit(:content,:status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end