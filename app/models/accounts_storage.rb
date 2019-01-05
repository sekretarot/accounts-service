require 'singleton'
class AccountsStorage
  include Singleton

  def initialize
    accounts_data = [{number: "3506988578", balance: 200, customer_id: 1},
                     {number: "3506988378", balance: 1460, customer_id: 2},
                     {number: "3506988532", balance: 3240, customer_id: 3},
                     {number: "3506988422", balance: 2100, customer_id: 1}]
    @accounts = accounts_data.map do |account_hash|
      Account.new(account_hash)
    end
  end

  def create_customer_account!(customer_id, initial_balance)
    new_account = Account.new({balance: initial_balance, customer_id: customer_id})
    @accounts << new_account
    new_account
  end

  def get_customer_accounts(customer_id)
    @accounts.select {|account| account.customer_id == customer_id}
  end

end