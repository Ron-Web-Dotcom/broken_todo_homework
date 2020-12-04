#ApplicationRecord ActionMailer has a default  emaio function with a mailer layout 

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
