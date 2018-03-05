class TasksController < ApplicationController

  def create
    house = House.find(params[:id])
    tasklist = Tasklist.create(house: house)
    create_tasks(house.phase, tasklist)
    redirect_to '/houses'
  end

  def destroy
    task = Task.find(params[:id])
    tasklist = task.tasklist
    house = tasklist.house
    puts house.phase
    task.destroy
    if tasklist.tasks.empty?
      puts 'HERE555'
      puts house.phase
      if house.phase < 5
        house.update(phase: house.phase + 1)
        create_tasks(house.phase, tasklist)
      else
        house.phase = 6
      end
    end
    return redirect_to "/houses/#{house.id}"

  end

end
