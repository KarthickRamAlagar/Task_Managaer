class Api::V1::TasksController < ApplicationController
  def index
    tasks = Task.all
    tasks = tasks.where(status: Task.statuses[params[:status]]) if params[:status]
    tasks = tasks.where(category_id: params[:category]) if params[:category]
    render json: tasks
  end

  def show
    task = Task.find(params[:id])
    render json: task
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      render json: task
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

def destroy
  task = Task.find(params[:id])
  task.destroy
  render json: { message: "Task with ID #{task.id} was successfully deleted." }, status: :ok
rescue ActiveRecord::RecordNotFound
  render json: { error: "Task not found with ID #{params[:id]}" }, status: :not_found
end


  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, :category_id)
  end
end
