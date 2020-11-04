class LeadsController < ApplicationController
    def user_leads
        @leads = Lead.where(:user_id => current_user.id)
    end

    def create
        @lead = Lead.new(lead_params)
        if user_signed_in?
        @lead.user_id = current_user.id
        end
        @lead.save
        
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

    private
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
  