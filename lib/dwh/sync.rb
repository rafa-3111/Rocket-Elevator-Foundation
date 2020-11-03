module Dwh
  class Sync

    def self.sync_fact_quotes
      for q in Quote.all do
        # gets the user from the quote in order to find the email associated with it
        user = User.find(q.user_id)
        # gets the customer from the quote to find it's company name
        customer = Customer.find(user.id)

        FactQuote.create!({
          quote_id: q.id,
          quote_created_at: q.created_at,
          company_name: customer.company_name,
          email: user.email,
          elevator_number: q.elevator_number
        })
      end
    end


    def self.sync_dim_customers
      for c in Customer.all do
        # variable that counts the total number of elevator for the customer
        elevator_number = 0
        customer_buildings = Building.where(customer_id: c.id).to_a
        for building in customer_buildings do
          # goes through all the batteries linked to the building to eventually reach every elevator in every column and adds them to the elevator_number variable
          batteries = Battery.where(building_id: building.id).to_a
          for battery in batteries do
            columns = Column.where(battery_id: battery.id).to_a
            for column in columns do
              elevators = Elevator.where(column_id: column.id).to_a
              elevator_number += elevators.size
            end
          end
        end
        city = Address.find(c.address_id).city

        DimCustomer.create!({
          customer_creation_date: c.created_at,
          company_name: c.company_name,
          company_contact_full_name: c.company_contact_full_name,
          company_contact_email: c.company_contact_email,
          elevator_number: elevator_number,
          customer_city: city
        })
      end
    end


    def self.sync_fact_elevators
      for e in Elevator.all do
        # drilling down all the way to the address and customer table to get the relevant info for each elevator
        column = Column.find(e.column_id)
        battery = Battery.find(column.battery_id)
        building = Building.find(battery.building_id)
        address = Address.find(building.address_id)
        customer = Customer.find(building.customer_id)
      
        FactElevator.create!({
          serial_number: e.serial_number,
          date_of_commissioning: e.date_of_commissioning,
          building_id: building.id,
          customer_id: customer.id,
          building_city: address.city
        })
      end
    end


    def self.sync_fact_contacts 
      for u in User.all do
        customer = Customer.find(u.id)
        lead = Lead.find(u.id)

        FactContact.create!({ 
          contact_id: u.id,
          creation_date: u.created_at,
          company_name: customer.company_name,
          email: u.email,
          project_name: lead.project_name
        })
      end
    end
  end
end
