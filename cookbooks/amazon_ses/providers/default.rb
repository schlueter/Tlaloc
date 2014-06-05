require 'aws/ses'

def whyrun_supported?
  true
end

def get_connection
    return AWS::SES::Base.new(
        access_key_id:     node[:aws][:access_key_id],
        secret_access_key: node[:aws][:secret_access_key]
    )
end

action :send_email do
    ses = get_connection
    ses.send_email(
        source:      @new_resource.source,
        from:        @new_resource.from,
        to:          @new_resource.to,
        cc:          @new_resource.cc,
        bcc:         @new_resource.bcc,
        subject:     @new_resource.subject,
        html_body:   @new_resource.html_body,
        text_body:   @new_resource.text_body,
        return_path: @new_resource.return_path,
        reply_to:    @new_resource.reply_to
    )
    new_resource.updated_by_last_action(true)
end

action :send_raw_email do
    ses = get_connection
    ses.send_raw_email(
        mail: @new_resource.mail,
        args: {
            source:      @new_resource.source,
            destination: @new_resource.destination,
            from:        @new_resource.from,
            to:          @new_resource.to
        }
    )
    new_resource.updated_by_last_action(true)
end
