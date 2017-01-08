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
  @amount = params[:amount]
 ###この操作で、Stripe から帰ってきた情報を取得します
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail], #emailは暗号化されずに受け取れます
    :source  => params[:stripeToken] #めちゃめちゃな文字列です
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
