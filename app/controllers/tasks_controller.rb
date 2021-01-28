class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: '(自作)記事を作成しました'
    else
      render 'new'
    end
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task, notice: '(自作)記事を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: '(自作)記事を削除しました'

  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body)
  end

end
