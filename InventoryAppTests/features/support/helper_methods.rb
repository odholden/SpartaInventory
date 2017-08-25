require 'mail'

module SendMail

  def self.send_email
    if Dir["**/screenshots/*"].length > 0
      # Emails a report of all screenshot failures
      options = { :address              => "smtp-mail.outlook.com",
                  :port                 => 587,
                  :domain               => "#{Socket.gethostname}",
                  :user_name            => 'mrkhan89@hotmail.co.uk',
                  :password             => "<password>",
                  :authentication       => 'plain',
                  :enable_starttls_auto => true  }
      Mail.defaults do
        delivery_method :smtp, options
      end
      Mail.deliver do
        to "mohammaduk@spartaglobal.com"
        from 'mrkhan89@hotmail.co.uk'
        subject 'Sparta Inventory Test Failure Report'
        body 'This email contains screenshot attachments of the Sparta Inventory web app, showing specific failed scenarios.'
        Dir["**/screenshots/*"].each {|file| add_file "#{file}" }
      end
    end
  end

end
