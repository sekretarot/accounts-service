# README

### How to run in development

To make inter-container communication work uncomment the line corresponding to your OS in `config/settings.yml`.
This will enable the service to access any other docker containers running locally on the specified ports.

Then, from the repository folder run: 

`docker-compose up --build`

This starts your Rails server **listening at port 3001** in a Docker container. 

### Example usage
Please note that the provided functionality here might be degraded depending on the availability of other services.

#### Api endpoints 

Service Health

GET `/health`

Get accounts belonging to a customer

GET `/accounts/customer?customer_id=3`

Create new account for customer

POST `/accounts?customer_id=12`
