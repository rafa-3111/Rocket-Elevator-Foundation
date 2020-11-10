class Customer < ApplicationRecord
  has_many :buildings
  has_one :address, :dependent => :delete
  belongs_to :user

  # This will trigger the method extract_file when a customer is either created or updated
  # after_create :extract_file
  # after_update :extract_file

  # This is the method to extract the attached file from a contact when it is converted as a Customer
  def extract_file
    user = User.find(self.user_id)
    user_leads = Lead.where(user_id: user.id)
    client = DropboxApi::Client.new(ENV["DROPBOX_AUTH_TOKEN"])
    folder_list = client.list_folder("", :recursive => false)
    maybe_folder = false
    maybe_file = false

    # This will look for existing folders named after the new user and won't create duplicate.
    for folder in folder_list.entries do
      if folder.name == "Customer_#{user.first_name}_#{user.last_name}"
        maybe_folder = true
      end
    end

    # If no folder already exists, a new one will be created
    if !maybe_folder
      client.create_folder "/Customer_#{user.first_name}_#{user.last_name}"
    end

    # This will look for existing files already name as stated to avoid duplicate.
    customer_files_list = client.list_folder("/Customer_#{user.first_name}_#{user.last_name}", :recursive => false)

    # This will verify the attachment and the upload it to the cloud storage.
    for leads in user_leads do
      if !leads.attachment.file.nil?
        for customer_files in customer_files_list.entries do
          if customer_files.name == leads.attachment_identifier
            maybe_file = true
          end
        end

        if !maybe_file
          file_content = IO.read "#{leads.attachment.current_path}"
          client.upload "/Customer_#{user.first_name}_#{user.last_name}/#{leads.attachment_identifier}", file_content, :mode => :add
        end

        # This last step will make sure to remove the file from the database and apply save as last step to ensure the file is deleted.
        leads.remove_attachment!
        leads.save
      end
    end
  end

  def custom_label_method
    "#{User.find(user_id).first_name} #{User.find(user_id).last_name}"
  rescue => e
    puts e
  end
  
end
