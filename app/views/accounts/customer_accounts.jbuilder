json.array! @accounts do |account|
  json.(account, :number, :balance)
  json.transactions account.transactions
end