class MailController < ApplicationController
  def index
  end

  def send_mail
    Rails.logger.info "Sending e-mail #{email}"
    ExampleMailer.sample_email.deliver_now!
    redirect_to mail_index_path, notice: 'Mail sent!'
  end

  private

  def email
    mail_params[:email]
  end

  def mail_params
    params.require(:mail).permit(:email)
  end
end
