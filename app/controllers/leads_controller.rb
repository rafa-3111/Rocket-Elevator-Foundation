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
    mail.from = Email.new(email: 'saadeddine.feki@gmail.com')
    personalization = Personalization.new
    personalization.add_to(Email.new(email: email))
    personalization.add_dynamic_template_data({
      "fullName" => full_name,
      "projectName" => project_name
    })
    mail.add_personalization(personalization)
    mail.template_id = 'd-b72925a3cde14490a006cfa172765874'
    
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    begin
        response = sg.client.mail._("send").post(request_body: mail.to_json)
    rescue Exception => e
        puts e.message
        puts "message send"
    end 
    #  end send mail


        # UI confirmation
        respond_to do |format|
            if @lead.save && user_signed_in?
                format.html { redirect_to my_leads_path, notice: 'Your lead as been successfully register !' }

            elsif @lead.save && !user_signed_in?
                format.html { redirect_to root_path, notice: 'Your lead as been successfully register !' }
            else
                format.html { render :new }
            end
        end
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
  
    def dropbox 
        client = DropboxApi::Client.new
        result = client.list_folder "/50"

        #puts client.inspect
        #puts "------------------------"
        #result = clien.create_folder "/50"

        
        lead = Lead.where().firt

        # public/uploads/lead/attachment

        client.uploads(lead.attached_fille)

        puts resultat.inspect
    end
  