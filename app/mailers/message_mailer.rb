class MessageMailer < ApplicationMailer
  default from: "Your Mailer <mark.hstu@gmail.com>"
  default to: "Your Name <mark.hstu@gmail.com>"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end
end
