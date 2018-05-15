class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
    if !session[:user_id]
      flash[:errors] = 'Please Log In'
      redirect_to '/'
    end
  end

  def user_val
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
  end

  def client_val
    params.require(:client).permit(:first_name, :last_name, :email, :phone, :birthday, :listing, :cio, :level)
  end

  def buyer_val
    params.require(:buyer).permit(:financer, :cash, :purchase_type, :listing)
  end

  def investor_val
    params.require(:investor).permit(:profit_margin, :sales_price, :listing)
  end

  def contact_val
    params.require(:contact).permit(:method, :description, :notes)
  end

  def house_val
    params.require(:house).permit(:address, :rooms, :bathrooms, :sqft, :description, :price, :client_id, :info)
  end

  def contract_val
    params.require(:contract).permit(:name, :attachment).merge(client_id: @client.id)
  end

  def vendor_val
    params.require(:vendor).permit(:company, :service, :phone, :source, :website, :rating, :notes)
  end

  def agent_val
    params.require(:agent).permit(:first_name, :last_name, :email, :phone)
  end

  def commission(num)
    if num.nil?
      return 0
    end
    century = num * 0.03
    after = century - (century * 0.06)
    total = (after * 0.80) - 33.00
    return total.round(2)
  end

  #

  def no_comma(value)
    value.gsub!(',','') if value.is_a?(String)
    value = value.to_f
    return value
  end

  def create_tasks(phase, tasklist)
    if phase == 0
      Task.create(task: 'Task 1, Phase 0', tasklist: tasklist)
      Task.create(task: 'Task 2, Phase 0', tasklist: tasklist)
      Task.create(task: 'Task 3, Phase 0', tasklist: tasklist)
      Task.create(task: 'Task 4, Phase 0 ', tasklist: tasklist)
      Task.create(task: 'Task 5, Phase 0', tasklist: tasklist)
      Task.create(task: 'Task 6, Phase 0', tasklist: tasklist)
      Task.create(task: 'Task 7, Phase 0', tasklist: tasklist)
    elsif phase == 1
      Task.create(task: 'Task 1, Phase 1', step: 1, tasklist: tasklist)
      Task.create(task: 'Task 2, Phase 1', step: 2, tasklist: tasklist)
      Task.create(task: 'Task 3, Phase 1', step: 1, tasklist: tasklist)
      Task.create(task: 'Task 4, Phase 1', step: 3, tasklist: tasklist)
      Task.create(task: 'Task 5, Phase 1', step: 4, tasklist: tasklist)
      Task.create(task: 'Task 6, Phase 1', step: 4, tasklist: tasklist)
      Task.create(task: 'Task 7, Phase 1', step: 5, tasklist: tasklist)
      Task.create(task: 'Task 8, Phase 1', step: 4, tasklist: tasklist)
      Task.create(task: 'Task 9, Phase 1', step: 4, tasklist: tasklist)
      Task.create(task: 'Task 10, Phase 1', step: 4, tasklist: tasklist)
    elsif phase == 2
      Task.create(task: 'Task 1, Phase 2', step: 6, tasklist: tasklist)
      Task.create(task: 'Task 2, Phase 2', step: 6, tasklist: tasklist)
      Task.create(task: 'Task 3, Phase 2', step: 6, tasklist: tasklist)
      Task.create(task: 'Task 4, Phase 2', step: 7, tasklist: tasklist)
      Task.create(task: 'Task 5, Phase 2', step: 8, tasklist: tasklist)
    elsif phase == 3
      Task.create(task: 'Task 1, Phase 3', step: 9, tasklist: tasklist)
      Task.create(task: 'Task 2, Phase 3', step: 10, tasklist: tasklist)
    elsif phase == 4
      Task.create(task: 'Task 1, Phase 4', step: 11, tasklist: tasklist)
      Task.create(task: 'Task 2, Phase 4', step: 12, tasklist: tasklist)
      Task.create(task: 'Task 3, Phase 4', step: 12, tasklist: tasklist)
      Task.create(task: 'Task 4, Phase 4', step: 12, tasklist: tasklist)
      Task.create(task: 'Task 5, Phase 4', step: 12, tasklist: tasklist)
      Task.create(task: 'Task 6, Phase 4', step: 12, tasklist: tasklist)
    elsif phase == 5
      Task.create(task: 'Task 1, Phase 5', step: 12, tasklist: tasklist)
      Task.create(task: 'Task 2, Phase 5', step: 15, tasklist: tasklist)
    end


  end

  def make_info(infolist)
    Info.create(name: 'Roofing', infolist: infolist)
    Info.create(name: 'Foundation', infolist: infolist)
    Info.create(name: 'Stove', infolist: infolist)
    Info.create(name: 'HVAC', infolist: infolist)
    Info.create(name: 'Remodeling', infolist: infolist)
    Info.create(name: 'Fireplace', infolist: infolist)
    Info.create(name: 'Key', infolist: infolist)
    Info.create(name: 'Septic', infolist: infolist)
    Info.create(name: 'Utilities', infolist: infolist)
    Info.create(name: 'Schools', infolist: infolist)
    Info.create(name: 'Photographer', infolist: infolist)
  end

  def info_val
    params.require(:info).permit(:name, :year, :kind, :primary_school, :high_school, :prepa, :photographer, :key)
  end

  def attraction_val
    params.require(:attraction).permit(:name)
  end

  def comment_val
    params.require(:comment).permit(:description, :topic)
  end

  def showings_val
    params.require(:showing).permit(:day, :when)
  end



















end
