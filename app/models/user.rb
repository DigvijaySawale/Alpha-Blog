class User < ApplicationRecord
  validates :username, presence: true, 
                      length: {minimum: 3, maximum: 25}, 
                      uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :email, presence: true, 
                    uniqueness: {case_sensitive: false},
                    length: {maximum: 105}, 
                    format: {with: VALID_EMAIL_REGEX}

end 