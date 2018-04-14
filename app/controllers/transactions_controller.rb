class TransactionsController < ApplicationController
  def index
    @listing = House.where("phase = '0'").includes(client: [:contacts])
    @phase1 = House.where("phase = '1'").includes(client: [:contacts])
    @phase2 = House.where("phase = '2'").includes(client: [:contacts])
    @phase3 = House.where("phase = '3'").includes(client: [:contacts])
    @phase4 = House.where("phase = '4'").includes(client: [:contacts])
    @phase5 = House.where("phase = '5'").includes(client: [:contacts])
    @phase6 = House.where("phase = '6'").includes(client: [:contacts])



    @today = Date.today
    puts @today

  end
end
