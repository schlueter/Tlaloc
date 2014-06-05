actions :send_email, :send_raw_email
default_action :send_email

attribute :source,      :kind_of => String, :required => true
attribute :from,        :kind_of => String
attribute :to,          :kind_of => Array,  :required => true
attribute :cc,          :kind_of => Array
attribute :bcc,         :kind_of => Array
attribute :subject,     :kind_of => String, :name_attribute => true
attribute :html_body,   :kind_of => String
attribute :text_body,   :kind_of => String
attribute :return_path, :kind_of => String
attribute :reply_to,    :kind_of => String
attribute :mail,        :kind_of => [String, Hash, Mail]
attribute :destination, :kind_of => String
