class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.group.tasks
  end

  def new
  end

  def create
    Task.create(task_params)
  end

  def show
    @task = Task.find(params[:id])
    @price = @task.price
  end

  def cash
  @amount = 500
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )


  ###この操作で、決済をします
  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  redirect_to  root_path
  end

private

def task_params
  params.permit(:trade, :goods, :name, :where, :when, :price, :about, :user_id, :group_id)
end
end
