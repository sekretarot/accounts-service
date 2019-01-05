class AccountsController < ApplicationController

  def customer_accounts
    @accounts = AccountsStorage.instance.get_customer_accounts(params[:customer_id])
  end

  def create
    account = AccountsStorage.instance.create_customer_account!(params[:customer_id], params[:initial_credit])
    account.create_transaction(params[:initial_credit]) if params[:initial_credit].to_i > 0
    render json: account.to_json if account
  end

end