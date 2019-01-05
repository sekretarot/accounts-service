class AccountsController < ApplicationController

  def customer_accounts
    accounts = AccountsStorage.instance.get_customer_accounts(params[:customer_id].to_i)
    render json: accounts.to_json
  end

  def create
    account = AccountsStorage.instance.create_customer_account!(params[:customer_id], params[:initial_credit])
    render json: account.to_json if account
  end

end