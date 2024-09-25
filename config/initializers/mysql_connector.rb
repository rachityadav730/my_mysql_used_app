# # config/initializers/mysql_connector.rb

# # Load the database configuration from the appropriate environment
# db_config = Rails.application.config.database_configuration[Rails.env]

# # Ensure the configuration is available
# if db_config.blank?
#   raise "Database configuration is missing for the #{Rails.env} environment."
# end

# # Initialize the database connector
# connector = MyMysqlGem::DatabaseConnector.new(
#   host: db_config['host'],
#   username: db_config['username'],
#   password: db_config['password'],
#   database: db_config['database']
# )

# # Establish the connection
# begin
#   connector.connect
#   puts "Successfully connected to the MySQL database."
# rescue StandardError => e
#   puts "Failed to connect to the MySQL database: #{e.message}"
# end


# config/initializers/mysql_connector.rb

# Load the database configurations for the current environment
db_configs = Rails.application.config.database_configuration[Rails.env]

# Ensure the configurations are available
if db_configs.blank?
  raise "Database configuration is missing for the #{Rails.env} environment."
end

# Initialize connectors for each database
begin
  primary_connector = MyMysqlGem::DatabaseConnector.new(
    host: db_configs['primary']['host'],
    username: db_configs['primary']['username'],
    password: db_configs['primary']['password'],
    database: db_configs['primary']['database']
  )
  primary_connector.connect
  puts "Successfully connected to the primary MySQL database."

  secondary_connector = MyMysqlGem::DatabaseConnector.new(
    host: db_configs['secondary']['host'],
    username: db_configs['secondary']['username'],
    password: db_configs['secondary']['password'],
    database: db_configs['secondary']['database']
  )
  secondary_connector.connect
  puts "Successfully connected to the secondary MySQL database."

  tertiary_connector = MyMysqlGem::DatabaseConnector.new(
    host: db_configs['tertiary']['host'],
    username: db_configs['tertiary']['username'],
    password: db_configs['tertiary']['password'],
    database: db_configs['tertiary']['database']
  )
  tertiary_connector.connect
  puts "Successfully connected to the tertiary MySQL database."

rescue StandardError => e
  puts "Failed to connect to one of the MySQL databases: #{e.message}"
end
