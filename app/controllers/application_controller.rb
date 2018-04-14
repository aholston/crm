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
      Task.create(task: 'Add Listing Documents to Listing Package Presentation', tasklist: tasklist)
      Task.create(task: 'Prepare Market Analysis', tasklist: tasklist)
      Task.create(task: 'Prepare Marketing Plan', tasklist: tasklist)
      Task.create(task: 'Prepare "About Me" ', tasklist: tasklist)
      Task.create(task: 'Prepare "Why That Price?"', tasklist: tasklist)
      Task.create(task: 'Prepare "Time Frame Idea"', tasklist: tasklist)
      Task.create(task: 'Follow up', tasklist: tasklist)
    elsif phase == 1
      Task.create(task: 'Yard signs/Flyers at property', step: 1, tasklist: tasklist)
      Task.create(task: 'Supra Box/Spare Key for property', step: 2, tasklist: tasklist)
      Task.create(task: 'Add property to Centralized Showing Systems', step: 1, tasklist: tasklist)
      Task.create(task: 'Upload property to MLS', step: 3, tasklist: tasklist)
      Task.create(task: 'Upload property to Skyslope', step: 4, tasklist: tasklist)
      Task.create(task: 'Add property to Facebook', step: 4, tasklist: tasklist)
      Task.create(task: 'Schedule photographer/Take preliminary pictures', step: 5, tasklist: tasklist)
      Task.create(task: 'Recieve signed ISD from seller', step: 4, tasklist: tasklist)
      Task.create(task: 'Recieve Ammendments from seller', step: 4, tasklist: tasklist)
      Task.create(task: 'Recieve survey from seller', step: 4, tasklist: tasklist)
    elsif phase == 2
      Task.create(task: 'Upload Pictures', step: 6, tasklist: tasklist)
      Task.create(task: 'Activate property on MLS', step: 6, tasklist: tasklist)
      Task.create(task: 'Email blast (Make sure "Jim Jackson" is specified supervisor, Make sure to have "Preferred")', step: 6, tasklist: tasklist)
      Task.create(task: 'Update client', step: 7, tasklist: tasklist)
      Task.create(task: 'Upload documents to Transaction Desk(MLS)', step: 8, tasklist: tasklist)
    elsif phase == 3
      Task.create(task: 'Create Net Sheet and Offer Comparison Sheet', step: 9, tasklist: tasklist)
      Task.create(task: 'Present all offers', step: 10, tasklist: tasklist)
    elsif phase == 4
      Task.create(task: 'Send all documentation to Title Company', step: 11, tasklist: tasklist)
      Task.create(task: 'Upload documentation to Sky Slope', step: 12, tasklist: tasklist)
      Task.create(task: 'Add Inspection date', step: 12, tasklist: tasklist)
      Task.create(task: 'Add inspection back date', step: 12, tasklist: tasklist)
      Task.create(task: 'Add signed Ammendment date', step: 12, tasklist: tasklist)
      Task.create(task: 'Add appraisal date', step: 12, tasklist: tasklist)
      Task.create(task: 'Add appraisal report date', step: 12, tasklist: tasklist)
      Task.create(task: 'All set up for CDA', step: 12, tasklist: tasklist)
      Task.create(task: 'Schedule Closing', step: 12, tasklist: tasklist)
      Task.create(task: 'Send contract to Lender', step: 13, tasklist: tasklist)
      Task.create(task: 'Prepare closing gift', step: 14, tasklist: tasklist)
      Task.create(task: 'Follow up twice a week', step: 15, tasklist: tasklist)
    elsif phase == 5
      Task.create(task: 'Assure funding/Pick up Check', step: 12, tasklist: tasklist)
      Task.create(task: 'Congratulations! Pick up sign and supra from property yard', step: 15, tasklist: tasklist)
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
