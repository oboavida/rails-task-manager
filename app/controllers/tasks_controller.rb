class TasksController < ApplicationController
  before_action :fetch_tasks, only: [:show, :edit, :task, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.update(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(fetch_tasks)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def fetch_tasks
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
