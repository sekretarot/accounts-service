class AccountsController < ApplicationController

  def customer_accounts
    @accounts = AccountsStorage.instance.get_customer_accounts(params[:customer_id])
  end

  def create
    begin
      account = AccountsStorage.instance.create_customer_account!(params[:customer_id], params[:initial_credit])
      transaction = account.create_transaction(params[:initial_credit]) if params[:initial_credit].to_i > 0
      render json: account.to_json if account
    rescue Errors::TransactionsServiceError
      AccountsStorage.instance.delete_account!(account)
      render json: {error: "Initial transacation could not be created"}, status: 500
    rescue StandardError
      render json: {error: "Account could not be created"}, status: 500
    end
  end

end