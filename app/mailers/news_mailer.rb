class NewsMailer < ApplicationMailer

  def new_news_email(email)
    mail(to: email, subject: "Thanks for signing up to our newsletter!")
  end
end
