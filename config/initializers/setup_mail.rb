if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => "app28537600@heroku.com",
    :password       => "1oxqizar",
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end