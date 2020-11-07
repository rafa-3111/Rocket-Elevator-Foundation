class LeadsController < ApplicationController

    require 'sendgrid-ruby'
    include SendGrid

    def user_leads
        @leads = Lead.where(:user_id => current_user.id)
    end

    def create
        @lead = Lead.new(lead_params)
        if user_signed_in?
        @lead.user_id = current_user.id
        end     
        puts lead_params 
        @lead.save
        
        send_mails()


        # UI confirmation

        if verify_recaptcha(model: @lead)
        respond_to do |format|
            if @lead.save  && user_signed_in?
                format.html { redirect_to my_leads_path, notice: 'Your lead as been successfully register !' }

            elsif @lead.save && !user_signed_in?
                format.html { redirect_to root_path, notice: 'Your lead as been successfully register !' }
            else
                format.html { render :new }
            end
        end
    else
        redirect_to root_path(anchor: "contact")
    end
    end

    
   def send_mails
# #   send mail

    #     # sendgrid sending 
    puts "********************* variable ***********************"    
    full_name = lead_params[:full_name]
    puts  full_name
    email = lead_params[:email]
    puts email
    project_name = lead_params[:project_name]
    puts project_name
   
    puts "********************************************"
        
    mail = Mail.new
    mail.from = Email.new(email: 'rocketelevatorscorp@gmail.com')
    personalization = Personalization.new
    personalization.add_to(Email.new(email: email))
    personalization.add_dynamic_template_data({
      "fullName" => full_name,
      "projectName" => project_name
    })
    mail.add_personalization(personalization)
    mail.template_id = 'd-85f237599dfe4df8a0896aa0ad379983'
    
    conf = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    begin
        response = conf.client.mail._("send").post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.parsed_body
        puts response.headers
    rescue Exception => e
        puts e.message
    end
    #  end send mail
   end



    def edit
        @lead = Lead.edit
    end
    


    def new
        @lead = Lead.new
    end

    
        def lead_params
            params.require(:lead).permit(:attachment, :full_name, :email, :phone, :business_name, :project_name, :department, :project_description, :message, :user_id)
        end
end
  
    