class Customer < ApplicationRecord
  has_many :buildings
  has_one :address, :dependent => :delete
  belongs_to :user
  after_create :extract_file
  after_update :extract_file

  def extract_file
    user = User.find(self.user_id)
    user_leads = Lead.where(user_id: user.id)
    client = DropboxApi::Client.new(ENV["DROPBOX_AUTH_TOKEN"])
    folder_list = client.list_folder("", :recursive => false)
    maybe_folder = false
    maybe_file = false

    for folder in folder_list.entries do
      if folder.name == "Customer_#{user.first_name}_#{user.last_name}"
        maybe_folder = true
      end
    end

    if !maybe_folder
      client.create_folder "/Customer_#{user.first_name}_#{user.last_name}"
    end

    customer_files_list = client.list_folder("/Customer_#{user.first_name}_#{user.last_name}", :recursive => false)

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

        leads.remove_attachment!
        leads.save
      end
    end
  end
end
