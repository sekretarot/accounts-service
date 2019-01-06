class TransactionsService
  include HTTParty
  base_uri Settings.transactions_service_url

  def initialize(account=nil)
    @account = account
  end

  def create_transaction(amount)
    begin
      options = {query: {account_number: @account.number, amount: amount}}
      response = self.class.post("/transactions", options)
      if response.ok?
        response.parsed_response
      else
        raise Errors::TransactionsServiceError.new
      end
    rescue StandardError
      raise Errors::TransactionsServiceError.new
    end
  end

  def get_transactions
    begin
      options = {query: {account_number: @account.number}}
      self.class.get("/transactions/account", options).parsed_response
    rescue StandardError
      nil
    end
  end

end