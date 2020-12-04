#ApplicationMailer ActionMailer has a default  emaio function with a mailer layout 

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
