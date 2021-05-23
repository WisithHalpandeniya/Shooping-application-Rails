class NewsLetterController < ApplicationController

  def create
    email = params[:email]
    @news_letter = NewsLetter.new(email: email)
    if @news_letter.valid?
      @news_letter.save
      NewsMailer.new_news_email(email).deliver_later
      flash[:message] =  "Congrats you have been registered for our news letter please check your mail"
      redirect_to root_path
    else
      flash.now[:messages] = @news_letter.errors.full_messages[0]
      redirect_to root_path
    end
    

  end
end
