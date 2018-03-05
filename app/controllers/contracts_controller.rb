class ContractsController < ApplicationController

  def create
    @client = Client.find(params[:id])
    contract = Contract.create(contract_val)
    p contract
    if contract.valid?
      flash[:errors] = 'success'
      return redirect_to '/clients'
    else
      flash[:errors] = contract.errors.full_messages
      return redirect_to '/clients'
    end
  end
end
