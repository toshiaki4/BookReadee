class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"abcxxxh1@gmail.com",subject: "confirmation"
  end
end
