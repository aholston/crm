class TasksController < ApplicationController

  def create
    house = House.find(params[:id])
    tasklist = Tasklist.create(house: house)
    create_tasks(house.phase, tasklist)
    redirect_to "/new_client/#{house.id}"
  end

  def destroy
    task = Task.find(params[:id])
    tasklist = task.tasklist
    house = tasklist.house
    task.destroy
    if tasklist.tasks.empty?
      if house.phase < 5
        house.update(phase: house.phase + 1)
        create_tasks(house.phase, tasklist)
        if house.phase == 4
          return redirect_to "/events/phase/#{house.id}"
        end
      elsif house.phase == 5
        user = User.find(session[:user_id])
        client = house.client
        client.update(listing: 'Closed')
        house.update(phase: 6)
        user.total_made += house.commission
        user.save
      end
    end
    return
  end

end
