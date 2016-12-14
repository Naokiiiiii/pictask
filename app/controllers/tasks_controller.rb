class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    Task.create(task_params)
  end

private
def task_params
  params.permit(:trade, :goods, :name, :where, :when, :price, :about)
end

end
