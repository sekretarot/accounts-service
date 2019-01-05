class TransactionsService
  include HTTParty
  base_uri Settings.transactions_service_url

  def initialize(account)
    @account = account
  end

  def create_transaction(amount)
    options = {query: {account_number: @account.number, amount: amount}}
    self.class.post("/transactions", options)
  end

  def get_transactions
    options = {query: {account_number: @account.number}}
    self.class.get("/transactions/account", options).parsed_response
  end

end