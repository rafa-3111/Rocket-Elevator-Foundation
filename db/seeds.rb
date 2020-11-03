# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

User.destroy_all
Address.destroy_all
Battery.destroy_all
Building.destroy_all
BuildingDetail.destroy_all
Employee.destroy_all
Customer.destroy_all
Lead.destroy_all
Quote.destroy_all
Column.destroy_all
Elevator.destroy_all

DatabaseCleaner.clean_with(:truncation)

randCustomerCreation = 100
randEmployeeCreation = 21

def seed_image
    File.open(File.join(Rails.root, "/app/assets/images/noYou/image.png"))
end

def create_employee randEmployeeCreation
    u1 = User.create(
        first_name: "Nicolas",
        last_name: "Genest",
        email: "nicolas.genest@codeboxx.biz",
        password: "NicolasGenest",
        created_at: Time.local(2017, 7, 8),
        title: "CEO",
        
        is_employee: true,
        is_user: false
    )
    
    Employee.create(
        user_id: u1.id,
        first_name: u1.first_name,
        last_name: u1.last_name,
        function: u1.title,
        phone: Faker::PhoneNumber.unique.cell_phone,
        email: u1.email
    )
    
    u2 = User.create(
        first_name: "Nadya",
        last_name: "Fortier",
        email: "nadya.fortier@codeboxx.biz",
        password: "NadyaFortier",
        created_at: Time.local(2017, 7, 8),
        title: "Director",
    
        is_employee: true,
        is_user: false
    )
    
    Employee.create(
        user_id: u2.id,
        first_name: u2.first_name,
        last_name: u2.last_name,
        function: u2.title,
        phone: Faker::PhoneNumber.unique.cell_phone,
        email: u2.email
    )
    
    u3 = User.create(
        first_name: "Martin",
        last_name: "Chantal",
        email: "martin.chantal@codeboxx.biz",
        password: "MartinChantal",
        created_at: Time.local(2017, 7, 8),
        title: "Director Assistant",
    
        is_employee: true,
        is_user: false
    )
    
    Employee.create(
        user_id: u3.id,
        first_name: u3.first_name,
        last_name: u3.last_name,
        function: u3.title,
        phone: Faker::PhoneNumber.unique.cell_phone,
        email: u3.email
    )
    
    u4 = User.create(
        first_name: "Mathieu",
        last_name: "Houde",
        email: "mathieu.houde@codeboxx.biz",
        password: "MathieuHoude",
        created_at: Time.local(2017, 7, 8),
        title: "Captain",
    
        is_employee: true,
        is_user: false
    )
    
    Employee.create(
        user_id: u4.id,
        first_name: u4.first_name,
        last_name: u4.last_name,
        function: u4.title,
        phone: Faker::PhoneNumber.unique.cell_phone,
        email: u4.email
    )
    
    u5 = User.create(
        first_name: "David",
        last_name: "Boutin",
        email: "david.boutin@codeboxx.biz",
        password: "DavidBoutin",
        created_at: Time.local(2017, 7, 8),
        title: "Engineer",
    
        is_employee: true,
        is_user: false
    )
    
    Employee.create(
        user_id: u5.id,
        first_name: u5.first_name,
        last_name: u5.last_name,
        function: u5.title,
        phone: Faker::PhoneNumber.unique.cell_phone,
        email: u5.email
    )
    
    u6 = User.create(
        first_name: "Mathieu",
        last_name: "Lortie",
        email: "mathieu.lortie@codeboxx.biz",
        password: "MathieuLortie",
        created_at: Time.local(2017, 7, 8),
        title: "Engineer",
    
        is_employee: true,
        is_user: false
    )
    
    Employee.create(
        user_id: u6.id,
        first_name: u6.first_name,
        last_name: u6.last_name,
        function: u6.title,
        phone: Faker::PhoneNumber.unique.cell_phone,
        email: u6.email
    )
    
    u7 = User.create(
        first_name: "Thomas",
        last_name: "Carrier",
        email: "thomas.carrier@codeboxx.biz",
        password: "ThomasCarrier",
        created_at: Time.local(2017, 7, 8),
        title: "Engineer",
    
        is_employee: true,
        is_user: false
    )
    
    Employee.create(
        user_id: u7.id,
        first_name: u7.first_name,
        last_name: u7.last_name,
        function: u7.title,
        phone: Faker::PhoneNumber.unique.cell_phone,
        email: u7.email
    )

    for i in 1..randEmployeeCreation do
        tmp_user = User.create(
            first_name: Faker::Name.unique.first_name,
            last_name: Faker::Name.unique.last_name,
            email: Faker::Internet.unique.email,
            title: Faker::Games::Overwatch.hero,
            created_at: Time.at((Time.local(2017, 7, 8).to_f - Time.local(2019, 7, 8).to_f)*rand + Time.local(2020, 7, 8).to_f),
            password: Faker::Internet.unique.password,
    
            is_employee: true,
            is_user: false
        )
    
        tmp_employee = Employee.create(
            user_id: tmp_user.id,
            first_name: tmp_user.first_name,
            last_name: tmp_user.last_name,
            function: ["Human Resource", "Staff", "Elevator Consultant", "Manager"].sample,
            phone: Faker::PhoneNumber.unique.cell_phone,
            email: tmp_user.email
        )
    end
end

def create_customer randCustomerCreation
    for i in 1..randCustomerCreation do
        addressy = Addressy::US.fetch(10)

        tmp_user = User.create(
            first_name: Faker::Name.unique.first_name,
            last_name: Faker::Name.unique.last_name,
            email: Faker::Internet.unique.email,
            title: Faker::Games::Overwatch.hero,
            created_at: Time.at((Time.local(2017, 7, 8).to_f - Time.local(2020, 7, 8).to_f)*rand + Time.local(2020, 7, 8).to_f),
            password: Faker::Internet.unique.password
        )

        tmp_customer_address = Address.create(
            type_of_address: ["House", "Apartment", "Commercial", "Corporate", "Hybrid"].sample,
            status: ["Active", "Inactive"].sample,
            entity: "Customer",
            number_and_street: addressy[0].street,
            suite_or_apartment: addressy[0].street.split(" ")[0],
            city: addressy[0].city,
            postal_code: addressy[0].zip,
            country: "USA",
            notes: Faker::Lorem.sentence(word_count: rand(3..9).floor),
            created_at: tmp_user.created_at
        )
        
        tmp_customer = Customer.create(
            address_id: tmp_customer_address.id,
            user_id: tmp_user.id,
            company_name: Faker::Company.unique.name,
            company_contact_full_name: Faker::Name.unique.name,
            company_contact_phone: Faker::PhoneNumber.cell_phone,
            company_contact_email: Faker::Internet.unique.email,
            company_description: Faker::Company.unique.catch_phrase,
            technical_authority_full_name: Faker::Name.unique.name,
            technical_authority_phone_number: Faker::PhoneNumber.cell_phone,
            technical_manager_email_service: Faker::Internet.unique.email,
            created_at: tmp_user.created_at
        )

        tmp_customer_address.update('customer_id' => tmp_customer.id)
        
        tmp_lead = Lead.create(
            user_id: tmp_user.id,
            full_name: tmp_user.first_name + " " + tmp_user.last_name,
            email: tmp_user.email,
            phone: Faker::PhoneNumber.cell_phone,
            business_name: tmp_customer.company_name,
            project_name: Faker::Name.unique.name,
            department: ["Elevator Consultant", "Building Manager", "Architect"].sample,
            project_description: Faker::Lorem.paragraph(sentence_count: 5),
            message: Faker::Lorem.paragraph(sentence_count: 5),
            attachment: seed_image,
            created_at: Time.at((tmp_user.created_at.to_f - Time.local(2020, 7, 8).to_f)*rand + Time.local(2020, 7, 8).to_f)
        )

        for j in 1..rand(1..4) do
            tmp_building_address = Address.create(
                type_of_address: ["House", "Apartment", "Commercial", "Corporate", "Hybrid"].sample,
                status: ["Active", "Inactive"].sample,
                entity: "Building",
                number_and_street: addressy[1].street,
                suite_or_apartment: addressy[1].street.split(" ")[0],
                city: addressy[1].city,
                postal_code: addressy[1].zip,
                country: "USA",
                notes: Faker::Lorem.sentence(word_count: rand(3..9).floor),
                created_at: Time.at((tmp_user.created_at.to_f - Time.local(2020, 7, 8).to_f)*rand + Time.local(2020, 7, 8).to_f)
            )

            tmp_building = Building.create(
                address_id: tmp_building_address.id,
                customer_id: tmp_customer.id,
                created_at: tmp_building_address.created_at
            )

            tmp_building_address.update('building_id' => tmp_building.id)

            tmp_building_detail = BuildingDetail.create(
                building_id: tmp_building.id,
                information_key: Faker::Lorem.sentence(word_count: rand(3..9).floor),
                value: Faker::Lorem.sentence(word_count: rand(3..9).floor),
                created_at: tmp_building.created_at
            )

            tmp_building.update_attributes(building_detail_id: tmp_building_detail.id)

            tmp_battery = Battery.create(
                building_id: tmp_building.id,
                battery_type: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
                battery_status: "ACTIVE",
                date_of_commissioning: Time.at((tmp_user.created_at.to_f - Time.local(2018, 7, 8).to_f)*rand + Time.local(2018, 7, 8).to_f),
                date_of_last_inspection: Time.at((tmp_building.created_at.to_f - Time.local(2020, 7, 8).to_f)*rand + Time.local(2020, 7, 8).to_f),
                certificate_of_operations: "NYC buildings",
                information: Faker::Lorem.sentence(word_count: 6),
                notes: Faker::Lorem.sentence(word_count: rand(3..12).floor),
                created_at: Time.at((tmp_building.created_at.to_f - Time.local(2020, 7, 8).to_f)*rand + Time.local(2020, 7, 8).to_f)
            )

            for g in 1..rand(1..6) do
                tmp_column = Column.create(
                    battery_id: tmp_battery.id,
                    column_type: tmp_battery.battery_type,
                    column_status: tmp_battery.battery_status,
                    number_of_floors_served: rand(2..50).floor,
                    information: Faker::Lorem.sentence(word_count: rand(3..12).floor),
                    notes: Faker::Lorem.sentence(word_count: rand(3..12).floor),
                    created_at: tmp_building.created_at
                )

                for z in 1..rand(1..6) do
                    tmp_elevator = Elevator.create(
                        column_id: tmp_column.id,
                        serial_number: Faker::IDNumber.invalid,
                        elevator_model: ["Elevatroma", "911-Elevator", "Elevator-Bee" , "Daily-Elevator"].sample,
                        elevator_type: tmp_battery.battery_type,
                        elevator_status: "ACTIVE",
                        date_of_commissioning: tmp_battery.date_of_commissioning,
                        date_of_last_inspection: tmp_battery.date_of_last_inspection,
                        certificate_of_inspection: ["Rocket TMP", "General"].sample,
                        information: Faker::Lorem.sentence(word_count: rand(3..12).floor),
                        notes: Faker::Lorem.sentence(word_count: rand(3..12).floor),
                        created_at: tmp_column.created_at
                    )
                end
            end
        end

        for j in 1..rand(1..4) do
            tmp_quote = Quote.create(
                user_id: tmp_user.id,
                building_type: tmp_battery.battery_type,
                unit_price: rand(7565..100000),
                install_fee: rand(2000..10000),
                total_price: rand(2000..1000000),
                elevator_number: rand(1..50).floor,
                product_line: ["Excelium", "Premium", "Standard"].sample,
                basements: rand(1..45).floor,
                floors: rand(1..100).floor,
                created_at: tmp_lead.created_at
            )

            if tmp_battery.battery_type == "Residential"
                tmp_quote.update("apartments" => rand(1..1000).floor)

            elsif tmp_battery.battery_type == "Commercial"
                tmp_quote.update("businesses" => rand(1..20).floor)
                tmp_quote.update("elevator_shafts" => rand(1..35).floor)
                tmp_quote.update("parking_spaces" => rand(1..140).floor)

            elsif tmp_battery.battery_type == "Corporate" || tmp_battery.battery_type == "Hybrid"
                tmp_quote.update("businesses" => rand(1..20).floor)
                tmp_quote.update("parking_spaces" => rand(1..140).floor)
                tmp_quote.update("occupants" => rand(1..1000).floor)
            end

            if tmp_battery.battery_type == "Hybrid"
                tmp_quote.update("opening_hours" => rand(1..24).floor)
            end
        end
    end

end

create_customer randCustomerCreation
create_employee randEmployeeCreation

Building.all.each { |b|
    employee1 = Employee.offset(rand(Employee.count)).first
    employee2 = Employee.offset(rand(Employee.count)).first

    while employee2 == employee1 do
        employee2 = Employee.offset(rand(Employee.count)).first
    end

    b.update_attributes(admin_contact_id: employee1.id)
    b.update_attributes(technical_contact_id: employee2.id)

    b.update_attributes(technical_contact_full_name: employee2.first_name + employee2.last_name)
    b.update_attributes(technical_contact_email: employee2.email)
    b.update_attributes(technical_contact_phone: employee2.phone)

    b.update_attributes(administrator_full_name: employee1.first_name + employee1.last_name)
    b.update_attributes(administrator_email: employee1.email)
    b.update_attributes(administrator_phone_number: employee1.phone)
}

User.create(
    first_name: "Admin",
    email: "admin@admin.com",
    password: "admin123",

    is_admin: true,
    is_user: false
)
