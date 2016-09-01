ActionMailer::Base.smtp_settings = {
  user_name:            ENV['MAILER_USERNAME'],
  password:             ENV['MAILER_PASSWORD'],
  domain:               ENV['MAILER_DOMAIN'],
  address:              ENV['MAILER_ADDRESS'],
  port:                 ENV['MAILER_PORT'],
  authentication:       :plain,
  enable_starttls_auto: true
}
