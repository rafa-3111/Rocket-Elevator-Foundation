# config/initializers/db_dwh.rb

config=YAML::load(ERB.new(File.read(Rails.root.join("config","dwh_db.yml"))).result)

DB_SECOND = config[Rails.env]