class ExampleMailer < ApplicationMailer
  default from: ENV['MAILER_FROM_ADDRESS']
  def sample_email
    mail(to: 'tim.costermans@unifiedpost.com', subject: 'Sample Email')
  end
end
