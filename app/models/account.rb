class Account
  attr_accessor :number, :balance, :customer_id

  def initialize(init_json)
    @number = init_json[:number] || random_account_number
    @balance = init_json[:balance].to_i
    @customer_id = init_json[:customer_id].to_i
  end

  def create_transaction(amount)
    TransactionsService.new(self).create_transaction(amount)
  end

  def transactions
    TransactionsService.new(self).get_transactions
  end

  private

  def random_account_number
    rand(10 ** 10)
  end

end