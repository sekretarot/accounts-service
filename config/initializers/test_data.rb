customers = [{name: "John", surname: "Doe", id: 1},
                  {name: "Jeroen", surname: "Van Dicht", id: 2},
                  {name: "Femke", surname: "Dijkstra", id: 3}]

customers.each do |customer_hash|
  Rails.cache.write(customer_hash[:id], customer_hash)
end