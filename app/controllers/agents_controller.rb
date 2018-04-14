class AgentsController < ApplicationController

  def index

    @agents = Agent.search(params[:search]).order(:first_name)
    @agents = @agents.page(params[:page]).per(15).includes(:house)

    @houses = House.all


  end

  def edit
    @agent = Agent.find(params[:id])
    @houses = House.all
  end

  def update
    agent = Agent.find(params[:id])

    agent.update(agent_val)

    redirect_to "/agents"
  end

  def create
    agent = Agent.new(agent_val)
    puts params[:house]
    if params[:house].empty? == false
      house = House.find(params[:house])
      agent.house = house
    end
    if agent.valid?
      agent.save
    else
      flash[:errors] = agent.errors.full_messages
    end
    return redirect_to '/agents'
  end

  def show
    @agent = Agent.find(params[:id])

  end

  def destroy
    agent = Agent.find(params[:id])
    agent.destroy
    redirect_to '/agents'
  end
end
